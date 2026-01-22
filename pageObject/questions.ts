

import { ActionHelper } from '../util/actionHelpers/actionHelper';
import logger from '../util/logger';

export default new class SecurityQuestionsPage extends ActionHelper {
    
    // Handle security questions - check question text first, then fill answer
    public async handleSecurityQuestions() {
        logger.info('🔐 Reading questions and filling appropriate answers...');
        
        try {
            // Question-Answer mapping
            const questionAnswerMap: { [key: string]: string } = {
                "What is your favorite dish?": "Dish",
                "Who is your favorite movie star?": "Star",
                "What is your favorite vacation city?": "City",
                "What was the name of your first school?": "School",
                "Who is your favorite sports team?": "Team",
                "What is your mother's maiden name?": "Maiden",
                "What was your first pet's name?": "Pet",
                "What is your favorite color?": "Color"
            };
            
            let questionsHandled = 0;
            const maxQuestions = 2; // Always 2 questions displayed
            
            // Loop through only 2 questions since that's what's always displayed
            for (let i = 1; i <= maxQuestions; i++) {
                try {
                    // Check if the question label exists
                    const questionLabelLocator = `//div[@id='qnaTable']//div[${i}]//label`;
                    
                    // Read the question text
                    const questionText = await this.getTextFromElement(questionLabelLocator);
                    logger.info(`📖 Question ${i}: "${questionText}"`);
                    
                    // Find the matching answer
                    let answer = '';
                    for (const [question, ans] of Object.entries(questionAnswerMap)) {
                        if (questionText.includes(question) || questionText.trim() === question) {
                            answer = ans;
                            break;
                        }
                    }
                    
                    if (answer) {
                        // Fill the answer field
                        const answerLocator = `//input[@id='Answer${i}']`;
                        await this.waitForElementVerification(answerLocator);
                        await this.enterText(answerLocator, answer);
                        logger.info(`✅ Filled Answer${i} with "${answer}" for question: "${questionText}"`);
                        questionsHandled++;
                    } else {
                        logger.info(`⚠ No matching answer found for question: "${questionText}"`);
                    }
                    
                } catch (error) {
                    logger.info(`Question/Answer ${i} not found or failed: ${error.message}`);
                }
            }
            
            logger.info(`✅ Filled ${questionsHandled} answer fields out of ${maxQuestions} questions`);
            
        } catch (error) {
            logger.error('❌ Failed to fill security questions:', error);
        }
    }
};
        
