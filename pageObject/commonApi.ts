import { Given, When, Then, setDefaultTimeout } from '@cucumber/cucumber';
import { loginRequest, fetchRequests, createRequest, updateRequest, removeRequest } from '../util/command';
import { userData } from '../testdata/login';
import * as assert from 'assert';
import { expect } from 'chai';
import { ActionHelper } from '../util/actionHelpers/actionHelper';
import { uatEndpoints } from '../testdata/urls';

let token;
export default new class commonApiPage extends ActionHelper {

  public async apiLogin(username: any, password: any){
    const loginUrl = uatEndpoints.loginUrl;
    await createRequest(loginUrl, { username: username, password: password }).then((res) => {
        token = res.data.token;
        expect(res.data, 'Data should contain a token property').to.have.property('token');
      });
  }
};
export { token };
