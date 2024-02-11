## Cypress & Cucumber BDD 🤖

### About this project

This project is about learning and practising the creation of automated UI tests using 
Cypress with *Behaviour-Driven-Development* using Cucumber BDD. 

The project closely follows the Udemy course called 
[Cypress with Cucumber BDD - Beginner to Expert in 9 Hours!](https://www.udemy.com/course/cypress-with-cucumber-bdd-beginner-to-expert-in-9-hours).

### Requirements

| Name       | Version |
|------------|---------|
| Node.js    | 20.8.0  |
| npm        | 10.2.0  |
| Cypress    | 12.14.0 |
| OpenJDK    | 11.0.22 |
| TypeScript | 5.3.3   |

### Cypress' structure

| Folder / File                 | Description                                                                |
|-------------------------------|----------------------------------------------------------------------------|
| `cypress/downloads`           |                                                                            |
| `cypress/e2e`                 | Location of the Cypress E2E test files                                     |
| `cypress/fixtures`            | For storing specific data, that can be used in the test files              |
| `cypress/support/commands.js` | For creating and storing custom Cypress commands                           |
| `cypress/support/e2e.js`      | The first file Cypress reads upon running it. Supports additional plugins. |
| `cypress.config.ts`           | For storing global settings, e.g. base URL, page load time etc.            |

The commands available to use within Cypress can be checked by clicking
[here](https://docs.cypress.io/api/table-of-contents).

For setting up the Cucumber Preprocessor
[this guide](https://github.com/badeball/cypress-cucumber-preprocessor/blob/master/docs/quick-start.md) was used. 
It also required [TypeScript](https://docs.cypress.io/guides/tooling/typescript-support#Install-TypeScript) to be properly installed inside the project.

