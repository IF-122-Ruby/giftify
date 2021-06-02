class AdminController < ActionController::Base

def admin
  @users = User.all
  @organizations = Organization.all

  @developers = [{name: "Mikhaylo",last_name: "Vasulenchuk", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"},
                 {name: "Dmutro",last_name: "Azarenko", avatar: "https://i.ibb.co/VTmPhRT/index.jpg"},
                 {name: "Diana",last_name: "Godovanets", avatar: "https://i.ibb.co/XV3RGTy/1.jpg"},
                 {name: "Denus",last_name: "Vinegod", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"},
                 {name: "Roman",last_name: "Panko", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"},
                 {name: "Vasul",last_name: "Yatsushun", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"},
                 {name: "Sofiia",last_name: "Hlushchak", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"},
                 {name: "Serhii",last_name: "Posternak", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"}]

end


end
