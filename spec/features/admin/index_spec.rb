require 'rails_helper'

RSpec.describe 'Admin Dashboard:', type: :feature do 

  describe 'As an Admin,' do
    context 'when I visit the admin dashboard (/admin),' do
      it 'I see a header indicating that I am on the admin dashboard.' do
        
        visit '/admin'

        expect(current_path).to eq('/admin')

        within('#admin_header') do
          expect(page).to have_content("Admin Dashboard")
        end
      end

      it 'I see a link to the admin merchants index (/admin/merchants), and a link to the admin invoices index (/admin/invoices)' do
        visit '/admin'
        save_and_open_page
        within('#admin_nav') do
          expect(page).to have_link('Merchants')
          expect(page).to have_link('Invoices')
        end
      end

      it "I see a section for 'Incomplete Invoices'," do

        within('section#incomplete_invoices') do
          expect(page).to have_content("Incomplete Invoices")
        end
      end

      it "In that section I see a list of the ids of all invoices that have items that have not yet been shipped" do

        within('section#incomplete_invoices') do
          expect(page).to have_content("Incomplete Invoices")
        end
      end
    end
    end
  end
end