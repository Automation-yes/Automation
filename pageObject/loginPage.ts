import commonPage from '../pageObject/commonPage';
import SecurityQuestionsPage from '../pageObject/questions';
import { userData } from '../testdata/login';
import { qcEndpoints,uatEndpoints,prodEndpoints } from '../testdata/urls';
import { ActionHelper } from '../util/actionHelpers/actionHelper';

const loginUrl = process.env.PRODUCTION ? prodEndpoints.loginUrl : process.env.UAT ? uatEndpoints.loginUrl : qcEndpoints.loginUrl;
const username = process.env.PRODUCTION ? userData.prodUsername : process.env.UAT ? userData.uatUsername : userData.qcUsername;
const password = process.env.PRODUCTION ? userData.prodPassword : process.env.UAT ? userData.uatPassword : userData.qcPassword;



export default new class login extends ActionHelper{
    async login() {
        await commonPage.navigateToLoginPage(loginUrl);
        await commonPage.login(username,password);
       
        
    }
};
