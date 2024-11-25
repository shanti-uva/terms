# This migration comes from terms_engine_engine (originally 20240902123011)
class MoveNumerologyToEnumerations < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.transaction do
      Definition.where("numerology IS NOT NULL").each do |d|
        e = Enumeration.new(:context_id => d.id, :context_type => 'Definition', :value => d.numerology)
        e.save
      end
    end
  end
end
