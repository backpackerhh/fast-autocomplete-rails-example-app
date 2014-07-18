class Verb < ActiveRecord::Base
  after_save     :load_into_soulmate
  before_destroy :remove_from_soulmate
 
  validates_uniqueness_of :name
 
  private

  def loader
    Soulmate::Loader.new('verbs')
  end
 
  def load_into_soulmate
    loader.add(
      'term' => name,
      'id'   => self.id,
      'data' => {
        'link' => Rails.application.routes.url_helpers.verb_path(self)
      }
    )
  end
 
  def remove_from_soulmate
    loader.remove('id' => self.id)
  end
end