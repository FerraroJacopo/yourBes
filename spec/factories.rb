FactoryBot.define do
    factory :city , class: City do
        nomecity {"Roma"}
        created_at {"bo"}
        updated_at {"bo"}
        id {"120"}
    end

    factory :user , class: User do
        email {"user@user.com"}
        password {"12345678"}
        admin {false}
        encrypted_password {"12345678"}
    end
end 