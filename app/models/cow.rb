class Cow < ActiveRecord::Base
  def self.search(name, owner)
    if (!name.nil? && ! name.empty?) && (! owner.nil? && ! owner.empty?)
      Cow.where(['name LIKE ? AND owner_id = ?', "%#{name}%", owner])
    elsif (! name.nil? && ! name.empty? )
      Cow.where(['name LIKE ?', "%#{name}%"])
    elsif (!owner.nil? && ! owner.empty? )
      Cow.where(owner_id:  owner)
    else
      Cow.all
    end
  end

  def self.searchOwner(search)
    if search
      Cow.where(['owner_id = ?', search])
    else
      Cow.all
    end
  end

  def self.pluck2hash( *col )
    Cow.pluck( *col ).map{|rec| Hash[*col.zip(rec).flatten]}
  end

  def self.pluck2array( *col )
    Cow.pluck( *col ).map{|rec| Array[*col.zip(rec)]}
  end
end
