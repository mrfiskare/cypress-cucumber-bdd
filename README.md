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
| `cypress/downloads`           | Location of files downloaded during test excecution                        |
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

When using `Scenario Outlines`, an `Examples` table should be created inside the feature file.
This table contains the different variable to be used for the scenario outline. In the Examples
table, every row equals to a test case.

### Background keyword

The `Background` section must be defined before the scenarios inside a feature file. It can be used
to reduce duplications inside the feature file. The content of the background section runs each
time we run a scenario of the given feature file.

### Tags

Tags can be used to... well, to tag features and/or scenarios inside the project. It is possible to
use the same tag for multiple features/scenarios. For example the `@regression` can be added to
both the `Login_Portal.feature` and the `Contact_Us.feature`. In this case it is possible to
target the `@regression` tag, which will in turn use the scenarios from both of the tagged
features.

This can be used with the following command:
`npx cypress run -e TAGS='@regression' --headed`

Additionally, it is possible to run scenarios with a given tag, but exclude some of the
scenarios with a specific tag.

For example:
`npx cypress run -e TAGS='@regression and not @smoke' --headed`

### Smoke tag

It is also possible to target only a subset of all the tests inside the project. This is
usually done by using the `@smoke` tag.

## Custom scripts

It is possible to create custom scripts for Cypress in the `scripts` section of the
`package.json` file. With these scripts we can specify options such as:

- headless / headed mode
- which browser to use
- which test spec files to run
- which tags to target

## Reports

### Generating HTML / JSON reports

Cucumber has built-in support for
[generating HTML](https://github.com/badeball/cypress-cucumber-preprocessor/blob/master/docs/html-report.md) / [JSON](https://github.com/badeball/cypress-cucumber-preprocessor/blob/master/docs/json-report.md) reports.

In order to take advantage of the HTML or JSON reporting tool, simply add this code to the
`cypress-cucumber-preprocessor` section of the `package.json` file:

```json
{
  "html": {
    "enabled": true,
    "output": "cypress/reports/cucumber-html/cucumber-report.html"
  },
  "json": {
    "enabled": true,
    "output": "cypress/reports/cucumber-json/cucumber-report.json"
  }
}
```

**Note:** The `output` property is optional. Cucumber places the generated report to the
project's root folder.

**Note:** JSON reports can be useful in automated CI/CD environments, such as Jenkins.

### Third party HTML reports

Third party Cucumber HTML reporters are widely available online. They can offer better
visuals, more detailed results etc. One if the third party reporters is called
[Multiple Cucumber HTML Reporter](https://www.npmjs.com/package/multiple-cucumber-html-reporter).
It uses the JSON file that we generate using Cucumber's aforementioned JSON generation tool.

## Using Cypress with Jenkins

### Technical notes

#### Installing Jenkins LTS on macOS

- Install the latest LTS version: `brew install jenkins-lts`
- Start the Jenkins service: `brew services start jenkins-lts`
- Update the Jenkins version: `brew upgrade jenkins-lts`

After starting the Jenkins service, browse to http://localhost:8080 and follow the
instructions to complete the installation.

**Note:** Before using Jenkins, make sure to have Java (_OpenJDK_) installed.

#### Stopping/Restarting Jenkins on macOS

- UI → Jenkins → Manage Jenkins → Prepare For Shutdown
- Stop Jenkins service: `brew services stop jenkins-lts`
- Restart the Jenkins service: `brew services restart jenkins-lts`

#### Uninstalling Jenkins on macOS

`/Library/Application Support/Jenkins/Uninstall.command`

### Configuring Cypress jobs using custom scripts

The initial setup for running Cypress tests can be done by:

1. Manage Jenkins → Plugins → Add → Nodejs Plugin, AnsiColor
2. New Job → Configure →
   1. **General:**
      1. This project is parameterized
      2. Choice Parameter
      3. **Name:** script
      4. **Choices:** Copy the scripts' name from the `package.json`
   2. **Build Environment:**
      1. Color ANSI Console Output
      2. Provide Node & npm bin/ folder to PATH
   3. **Build steps:**
      1. `npm install`
      2. `npm run $script` _(choice parameter)_
      3. `node cucumber-html-report.js`

### Configuring Cypress jobs using tags

1. Manage Jenkins → Plugins → Add → Nodejs Plugin, AnsiColor
2. New Job → Configure →
   1. **General:**
      1. This project is parameterized
      2. Choice Parameter
      3. **Name:** tag
      4. **Choices:** copy the names of tags used in the project _(e.g. regression, smoke)_
   2. **Build Environment:**
      1. Color ANSI Console Output
      2. Provide Node & npm bin/ folder to PATH
   3. **Build steps:**
      1. `npm install`
      2. `npx cypress run -e TAGS="@$tag and not @ignore"` _(choice parameter)_
      3. `node cucumber-html-report.js`
