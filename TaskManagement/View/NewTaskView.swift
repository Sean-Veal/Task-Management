//
//  NewTaskView.swift
//  TaskManagement
//
//  Created by Sean Veal on 7/18/23.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) private var dismiss
    /// Model Context For Saving Data
    @Environment(\.modelContext) private var context
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = .mint
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Task Title")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                TextField("Go for a Walk", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            })
            .padding(.top, 5)
            
            HStack(spacing: 12, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                })
                .padding(.top, 5)
                /// Giving some Space for tapping
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    let colors: [Color] = [.mint, .green, .blue, .yellow, .cyan]
                    
                    HStack(spacing: 0, content: {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 20, height: 20)
                                .background(
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                )
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        taskColor = color
                                    }
                                }
                        }
                    })
                })
                })
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            Button(action: {
                /// Saving Task
                let task = Task(taskTitle: taskTitle, creationDate: taskDate, tint: taskColor.toHex() ?? "")
                do {
                    context.insert(task)
                    try context.save()
                    /// After successful task creation, dismissing the view
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Create Task")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor, in: .rect(cornerRadius: 10))
            })
            .disabled(taskTitle == "")
            .opacity(taskTitle == "" ? 0.5 : 1)
        })
        .padding(15)
        
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}
