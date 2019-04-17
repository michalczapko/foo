module Foo
  module Address
    extend self

    ADDRESSES = {
      travelodge: {
        uk_postcode: "E1 7EZ",
        town: "London",
        address_1: "20 Middlesex Street",
        phone: 	"(871) 984 6534"
      },
      point_a: {
        uk_postcode: "N1 6BX",
        town: "London",
        address_1: "13-15 Folgate Street",
        address_2: "Spitalfields"
      }
    }

    def uk_postcode(branch)
      ADDRESSES[branch.to_sym][:uk_postcode] || ADDRESSES[branch.to_sym][:zipcode]
    end

    alias_method :zipcode, :uk_postcode

    def town(branch)
      ADDRESSES[branch.to_sym][:town]
    end

    def address_1(branch)
      ADDRESSES[branch.to_sym][:address_1]
    end

    def address_2(branch)
      ADDRESSES[branch.to_sym][:address_2]
    end

    def phone(branch)
      ADDRESSES[branch.to_sym][:phone]
    end

    def full_address(branch)
      address = "#{ address_1(branch) }#{ ', ' + address_2(branch) if address_2(branch) }, #{ town(branch) } #{ uk_postcode(branch) }"
      if phone(branch) 
        address = "#{address}, #{phone(branch)}"
      end
      address
    end

    def full_address_as_array(branch)
      [
        address_1(branch),
        address_2(branch),
        town(branch),
        uk_postcode(branch),
        phone(branch)
      ].compact
    end
  end
end

