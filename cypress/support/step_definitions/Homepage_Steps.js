import { Given } from '@badeball/cypress-cucumber-preprocessor';

const url = 'https://www.webdriveruniversity.com';

Given(`I navigate to the WebdriverUniversity homepage`, () => {
  cy.visit(url);
});
