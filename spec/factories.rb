FactoryGirl.define do
  factory :commune_admin do
    user_id 1
    commune_id 1
  end
  factory :admin do
    user_id 1
    commune_id 1
  end

  factory :user, :class => User do
    username "test_user"
    password "test_password"
    password_confirmation "test_password"
    email "test_email@email.com"
    name "AapeliTestaaja"
  end

  factory :user2, :class => User do
    username "test_user_2"
    password "test_password"
    password_confirmation "test_password"
    name "AapoTestaaja"
  end

  factory :commune, :class => Commune do
    name "test_commune_1"
    description "test_commune_1"
    after(:create) do
      commune.users
    end
  end

  factory :commune2, :class => Commune do
    name "test_commune_2"
    description "test_commune_2"
  end

end
