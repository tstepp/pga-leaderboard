class Player
  JSON.mapping({
    player_bio: Bio,
    course_hole: {type: Int32, nilable: true},
    thru: {type: Int32, nilable: true},
    today: {type: Int32, nilable: true},
    total: {type: Int32, nilable: true}
  })

  class Bio
    JSON.mapping({
      first_name: String,
      last_name: String
    })
  end

  delegate first_name,
           last_name,
           to: @player_bio

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
