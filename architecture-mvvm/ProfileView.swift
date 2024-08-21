//MARK: - VIEW
import SwiftUI

struct ProfileView: View {
    
    @State var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            //Perfil ---
            Image(viewModel.user.picture)
                .resizable()
                .frame(width: 250, height: 250)
                .cornerRadius(250)
            
            Text(viewModel.user.name)
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 10)
            
            Text(viewModel.user.nick)
                .font(.system(size: 23, weight: .regular))
                .foregroundColor(.gray)
            
            Text(viewModel.userFollowers)
                .font(.system(size: 80, weight: .light))
                .padding(40)
            
            VStack{
                //Seguir ---
                Button{ viewModel.followToggle()} label: {
                    Label( !viewModel.isFollowing ? "follow" : "unfollow", systemImage: "")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(!viewModel.isFollowing ? .blue : .black)
                
                //Enviar ---
                Button{} label: {
                    Label("enviar mensagem", systemImage: "")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(!viewModel.isFollowing)
                
            }
            .padding(20)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
