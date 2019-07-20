class CreateUserInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_institutions do |t|
      t.references :user, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
