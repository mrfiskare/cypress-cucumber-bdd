# Cypress & Cucumber BDD 🤖

## About this project

This project is about learning and practising the creation of automated UI tests using
Cypress with _Behaviour-Driven-Development_ using Cucumber BDD.

The project closely follows the Udemy course called
[Cypress with Cucumber BDD - Beginner to Expert in 9 Hours!](https://www.udemy.com/course/cypress-with-cucumber-bdd-beginner-to-expert-in-9-hours).

## Requirements

| Name       | Version |
| ---------- | ------- |
| Node.js    | 20.8.0  |
| npm        | 10.2.0  |
| Cypress    | 12.14.0 |
| OpenJDK    | 11.0.22 |
| TypeScript | 5.3.3   |

## Cypress' structure

| Folder / File                 | Description                                                                |
| ----------------------------- | -------------------------------------------------------------------------- |
| `cypress/downloads`           |                                                                            |
| `cypress/e2e`                 | Location of the Cypress E2E test files                                     |
| `cypress/fixtures`            | For storing specific data, that can be used in the test files              |
| `cypress/support/commands.ts` | For creating and storing custom Cypress commands                           |
| `cypress/support/e2e.ts`      | The first file Cypress reads upon running it. Supports additional plugins. |
| `cypress.config.ts`           | For storing global settings, e.g. base URL, page load time etc.            |

The commands available to use within Cypress can be checked by clicking
[here](https://docs.cypress.io/api/table-of-contents).

For setting up the Cucumber Preprocessor
[this guide](https://github.com/badeball/cypress-cucumber-preprocessor/blob/master/docs/quick-start.md) was used.
It also required [TypeScript](https://docs.cypress.io/guides/tooling/typescript-support#Install-TypeScript) to be properly installed inside the project.

## What is Gherkin?

**Gherkin is a language** that Cucumber understands. It is a Business Readable,
Domain Specific Language that lets you describe software's behavior without
detailing how tha behavior is implemented.

Cucumber basically acts like a bridge between business readable language and Cypress.

### Popular Keywords:

- **Feature File:** High level description of a software feature / test scenario(s).
- **Scenario:** Used to describe a specific test scenario(s) inside a _feature file_.
- **Given:** Describes the pre-requisite for given test scenario(s).
- **When:** Describes an event or action.
- **And:** Provides a logical AND condition between statements.
- **Then:** Used to describe an expected outcome.

### How features and scenarios work

A feature file describes one or more scenarios regarding a software feature. Then,
it defines one or more test cases regarding that scenario, using the Gherkin keywords.

After defining feature files and the scenarios within those feature files, we need to
make step definitions that are the technical representations of the steps of our scenarios.

It is recommended to create positive and negative test scenarios for the features.
For example, one positive scenario for a successful form submission, and a negative one,
when we forget to fill the email input field.

## Cucumber / Gherkin useful terms

### Cucumber Expressions

It is possible to use [regular expressions](https://github.com/cucumber/cucumber-expressions#readme)
and parameters with Cucumber tests.

### Scenario Outlines

Additionally, these expressions can be used within the so-called _Scenario Outlines_ that
describe the same actions of a scenario with dynamically changed parameters. For example, it
is very convenient to create a Scenario Outline for a negative and a positive test scenario,
where we use the same steps but with different values. This approach helps us to be more in
line with the DRY Principle (Don't Repeat Yourself).

### Examples keyword

When using Scenario Outlines, an Examples table should be created inside the feature file.
This table contains the different variable to be used for the scenario outline. In the Examples
table, every row equals to a test case.

### Background keyword

The background section must be defined before the scenarios inside a feature file. It can be used
to reduce duplications inside the feature file. The content of the background section runs each
time we run a scenario of the given feature file.
