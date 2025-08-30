# Lab 4: Organizing a Larger Spec Suite (Deck & Card)

This lab challenges you to organize a larger spec suite for a Ruby project with multiple classes: **Deck** and **Card**. You'll write and organize RSpec tests for these card game classes, focusing on clarity, maintainability, and DRY principles. All your specs should focus on testing the behaviors and interactions of Deck and Card.

**Make sure you have Ruby installed and run `bundle install` before starting this lab.**

## Instructions

1. **Open the specs for Deck and Card in `spec/student/` and organize them for clarity and maintainability.**

   - Look for repeated setup, similar expectations, or repeated Deck/Card objects—these are good candidates for `subject`, `let`, or shared examples.
   - "Refactor the specs" means: group related tests, use `context` for different Deck/Card scenarios, and use shared examples to avoid duplication.

2. Use `context` and `describe` blocks to organize your Deck and Card tests.

   - `describe` is used for grouping tests by method or class (e.g., `describe Deck do ... end`).
   - `context` is used for grouping tests by scenario or condition (e.g., "when the deck is empty").
   - Example of nested structure (not a solution):

      ```ruby
      describe Deck do
        context "when empty" do
          it "has no cards" do
            # ...
          end
        end
      end
      ```

3. Use `subject` to DRY up repeated Deck or Card object creation, and `let` for reusable values.

   - `subject` is for the main object under test (e.g., `subject(:deck) { Deck.new }`); `let` is for supporting objects or values (e.g., `let(:card) { Card.new("Hearts", "A") }`).
   - Example (not a solution):

      ```ruby
      subject(:deck) { Deck.new }
      let(:card) { Card.new("Hearts", "A") }
      ```

4. Use shared examples to avoid duplication in your Deck and Card specs.

   - Shared examples let you define a set of tests and reuse them for different objects or scenarios (e.g., shared examples for card behaviors).
   - Example (not a solution):

      ```ruby
      shared_examples "a face card" do
        it "has a value of 10" do
          # ...
        end
      end
      it_behaves_like "a face card"
      ```

     - You can pass parameters to shared examples using `let` or by passing arguments.
5. Keep one expectation per `it` block for clarity.
6. Run `bin/rspec` frequently to make sure your Deck and Card spec refactoring doesn't break any tests.
7. Do **not** change any files in `spec/meta/`—these are lab checker specs that verify your Deck and Card specs. In the test output, any spec labeled with `[LAB CHECKER]` is an official lab checker (not written by you) and is there to help you know if your specs meet the requirements.

## What to focus on

- Use `context` for different Deck and Card scenarios.
- Use `subject` to DRY up repeated Deck/Card object creation.
- Use shared examples to avoid duplication in your Deck and Card specs.
- Organize your Deck and Card specs for clarity and maintainability.

## Resources

- [RSpec Documentation](https://rspec.info/documentation/)
