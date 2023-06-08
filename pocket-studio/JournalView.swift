import SwiftUI

struct JournalPage1: View {
    @State private var newEntry: String = ""
    @State private var entries: [String] = []
    @State private var selectedEntry: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack {
                // TODO: BOLD THE DATES AND ADD ENTRY BUTTON TEXT.
                
                // DATE
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                    .frame(width: 110, height: 20)
                    .overlay(
                        Text("June 6th, 2023")
                            .foregroundColor(.white)
                            .font(.custom("Inter Regular", size: 14))
                    )
                    .offset(x:120, y: -10)
                
                // CLOUD TEXT
                Text("Crying is a healthy and effective way to express your emotions. When was the last time you cried and what made you cry?")
                    .font(.custom("Inter Regular", size: 10))
                    .tracking(1.4)
                    .frame(maxWidth: 220)
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: 20)
                
                // TODO: Dynamic user interaction: Make face slidable and divide range of positions into three.
                
                // MOOD SLIDER
                HStack{
                    Divider()
                        .frame(width: 100, height: 4)
                        .overlay(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .offset(x:148)
                    
                    Image("neutral")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                        .offset(x:40)
                }.offset(y:35)
                
                // FOR USER TO INPUT JOURNAL ENTRY
                TextEditor(text: $newEntry)
                    .scrollContentBackground(.hidden)
                    .font(.custom("Inter Regular", size: 19.2))
                    .lineSpacing(8.5)
                    .offset(x:-30, y: -8)
                    .padding(.horizontal, 30)
                    .overlay(
                        Text("Enter journal entry here.")
                            .font(.custom("Inter Regular", size: 15))
                            .opacity(newEntry.isEmpty ? 0.4 : 0),
                        alignment:.topLeading
                    ).offset(x:30, y:38)
                
                // FOR USER TO STORE ENTRY
                //TODO: Display $newEntry string after button is tapped.
                Button(action: {
                    if !newEntry.isEmpty {
                        entries.append(newEntry)
                        newEntry = ""
                    }
                }) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 100, height: 30)
                        .overlay(
                            Text("Add Entry")
                                .foregroundColor(.white)
                                .font(.custom("Inter Regular", size: 15))
                            //                            .font(.system(size: 30, weight: .heavy))
                        )
                        .offset(x:0, y:20)
                }
                .padding(.horizontal)
                
                // TODO: Move the 'add entry' button up and remove a line or two from the background so NAV BAR is not covering it.
                
                // TODO: Add 'NAV BAR' here (last item in VStack).
                
            }
            
            // TODO: Get buttons to take user to corresponding page.
            HStack{
                // BACK BUTTON
                NavigationLink(destination: JournalCover()
                    .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 50, height: 50)
                        .overlay(Image("backArrow").offset(x:10))
                        .offset(x:-170, y:0)
                }
                
                // FORWARD BUTTON
                NavigationLink(destination: JournalPage2()
                    .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 50, height: 50)
                        .overlay(Image("forwardArrow").offset(x:-10))
                        .offset(x:170, y:0)
                }
                
            }.zIndex(1)
        }
        .padding(.vertical)
        .background(
            Image("page1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

struct JournalPage1_Previews: PreviewProvider {
    static var previews: some View {
        JournalPage1()
    }
}
