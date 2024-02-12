import { When, Then } from '@badeball/cypress-cucumber-preprocessor';

let stub: any;

When(
  `I type a username {string} and a password {string}`,
  (userName: string, password: string) => {
    cy.get('#text').type(userName);
    cy.get('#password').type(password);
  }
);

When(`I click on the login button`, () => {
  stub = cy.stub();
  cy.on('window:alert', stub);
  cy.get('#login-button').click();
});

Then(
  `I should be presented with alert box text {string}`,
  (expectedAlertText: string) => {
    expect(stub).to.have.been.calledWith(expectedAlertText);
  }
);
