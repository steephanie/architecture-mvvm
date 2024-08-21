//MARK: - VIEWMODEL
import Foundation

struct ProfileViewModel{
    
    var isFollowing = false
    var userFollowers = String()
    
    var user = User(picture: "perfil_ste",
                    name: "Stephanie Nascimento",
                    nick: "steephanie",
                    fallowers: 1999)
    init(){
        loadFallowers()
    }
    
    mutating func loadFallowers(){
        self.userFollowers = customizeNumber(value: user.fallowers)
    }
    
    func customizeNumber(value: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt-BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    mutating func followToggle(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.fallowers += 1) : (self.user.fallowers -= 1)
        loadFallowers()
    }
}
