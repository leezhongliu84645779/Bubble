class Forum < ApplicationRecord
    def self.filter_by_college_name(arg)
      record = Forum.where('name LIKE ?', '%'+ arg.strip+ '%').all
    end
end
