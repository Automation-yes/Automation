import axios from 'axios';
import exp from 'constants';
import { expect } from 'chai';
import fs from 'fs';
import path from 'path';


export const fetchRequests = async function (url, token) {
  const headers = {
    'Authorization': `Bearer ${token}`,
  };
  const response = await axios.get(url, { headers });
  return response;
};

export const createRequest = async function (url, body, token?) {

  const headers = {
    'Authorization': `Bearer ${token}`,
  };
  const response = await axios.post(url, body, { headers });
  return response;
};

export const updateRequest = async function (url, body, token) {
  const headers = {
    'Authorization': `Bearer ${token}`,
  };
  const response = await axios.put(url, body, { headers });
  return response;
};

export const removeRequest = async function (url, body) {
  const response = await axios.delete(url, body);
  return response.data;
};

export const loginRequest = async function (url, username, password, token?) {
  const payload = {
    username: `${username}`,
    password: `${password}`,
  };
  const headers = {
    'Authorization': `Bearer ${token}`,
  };
  const response = await axios.post(url, payload, { headers });
  return response;
};


