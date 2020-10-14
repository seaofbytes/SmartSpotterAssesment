# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :booking, foreign_key: true
      t.references :invitee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
