import SwiftUI
import CoreLocationUI

struct FirstView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    // 배경 이미지 설정
                    VStack{
                        Spacer()
                        
                        Image("backgroundImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width)
                            .edgesIgnoringSafeArea(.all)
                        
                        Spacer()
                    }
                    
                    
                    VStack(spacing: 50) {
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 100, height: 100) // 간격의 크기 조절
                        
                        HStack(spacing: 15){
                            Image("buttonImage") // buttonImage는 버튼으로 사용할 이미지의 이름입니다.
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                            NavigationLink(destination: SecondView()) { // NavigationLink를 사용하여 다음 화면으로 이동
                                Text("")
                                    .frame(width: 150, height: 150)
                                    .background(
                                        Image("buttonImage2") // buttonImage는 버튼으로 사용할 이미지의 이름입니다.
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150, height: 150)
                                    )
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                        
                        
                        
                        HStack(spacing: 15){
                            Image("buttonImage3") // buttonImage는 버튼으로 사용할 이미지의 이름입니다.
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                            Image("buttonImage4") // buttonImage는 버튼으로 사용할 이미지의 이름입니다.
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 100, height: 140) // 간격의 크기 조절
                    }
                    .padding()
                }
            }
            .navigationBarTitle("") // 뒤로가기 버튼 텍스트 제거
            .navigationBarHidden(true) // 네비게이션 바 숨김
        }
    }
}

struct SecondView: View {
    @EnvironmentObject var locationManager: LocationManager
        
        var body: some View {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Construction Safety Check")
                        .font(.custom("Futura", size: 30))
                        
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                    }
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.black, lineWidth: 2)             )
            }
        }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
