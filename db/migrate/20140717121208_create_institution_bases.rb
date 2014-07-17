class CreateInstitutionBases < ActiveRecord::Migration
  def change
    create_table :institution_bases do |t|
      t.string :name
      t.string :type
      t.timestamps
    end
  end
end
