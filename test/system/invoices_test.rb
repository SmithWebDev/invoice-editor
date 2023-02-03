require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoice(:first) # Reference to the first fixture invoice
  end

  test "Creating a new invoice" do
    # When we visit the Invoices#index page
    # we expect to see a title with the text "Invoices"
    visit invoices_path
    assert_selector "h1", text: "Invoices"

    # When we click on the link with the text "New invoice"
    # we expect to land on a page with the title "New invoice"
    click_on "New invoice"
    assert_selector "h1", text: "New invoice"

    # When we fill in the name input with "Capybara invoice"
    # and we click on "Create Invoice"
    fill_in "Name", with: "Capybara invoice"
    click_on "Create invoice"

    # We expect to be back on the page with the title "Invoices"
    # and to see our "Capybara invoice" added to the list
    assert_selector "h1", text: "Invoices"
    assert_text "Capybara invoice"
  end

  test "Showing an Invoice" do
    visit invoices_path
    click_link @invoice.name

    assert_selector 'h1', test: @invoice.name
  end

  test "Updating an Invoice" do
    visit invoices_path
    assert_selector "h1", text: "Invoice"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Invoice"

    fill_in "Name", with: "Updated Invoice"
    click_on "Update Invoice"

    assert_selector "h1", text: "Invoice"
    assert_text "Updated Invoice"
  end

  test "Destroying a quote" do
    visit invoices_path
    assert_text @invoice.name

    click_on "Delete", match: :first
    assert_no_text @invoice.name
  end
end
