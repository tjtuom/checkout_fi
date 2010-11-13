module Checkoutfi
  module Test
    module Actions
      def complete_payment_at_checkoutfi
        find(:xpath, "//input[@src='/static/img/osuuspankki.png']").click
        fill_in('id', :with => '123456')
        fill_in('pw', :with => '7890')
        click_button('Jatka')

        fill_in('avainluku', :with => '1234')
        click_button('Jatka')

        click_button('Hyväksy')

        click_link('Palaa palveluntarjoajan sivulle')
      end
    end
  end
end
