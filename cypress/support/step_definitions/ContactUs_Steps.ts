import { When, Then } from '@badeball/cypress-cucumber-preprocessor';

When(`I type a first name`, () => {
  cy.get('[name="first_name"]').type('John');
});

When(`I type a last name`, () => {
  cy.get('[name="last_name"]').type('Snow');
});

When(`I enter an email address`, () => {
  cy.get('[name="email"]').type('winteriscoming@mail.com');
});

When(`I type a comment`, () => {
  cy.get('textarea[name="message"]').type('You know nothing');
});

When(`I click on the submit button`, () => {
  cy.get('[type="submit"]').click();
});

Then(
  `I should be presented with a successful contact us submission message`,
  () => {
    cy.get('h1').should('have.text', 'Thank You for your Message!');
  }
);

Then(
  `I should be presented with a unsuccessful contact us submission message`,
  () => {
    cy.get('body').contains('Error: Invalid email address');
  }
);

When(`I type a specific first name {string}`, (firstName: string) => {
  cy.get('[name="first_name"]').type(firstName);
});

When(`I type a specific last name {string}`, (lastName: string) => {
  cy.get('[name="last_name"]').type(lastName);
});

When(`I type a specific email address {string}`, (email: string) => {
  cy.get('[name="email"]').type(email);
});

When(
  `I type a specific word {string} and a number {int} within the comment input field`,
  (word: string, number: number) => {
    cy.get('textarea[name="message"]').type(word + number);
  }
);
