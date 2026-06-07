//
//  AuthComponents.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Components/AuthComponents.swift
import SwiftUI
 
// MARK: - Koliko Logo
struct KolikoLogo: View {
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
    var body: some View {
        (Text("Koliko").font(.system(size: 20, weight: .bold))
        + Text("+").font(.system(size: 20, weight: .bold)).foregroundColor(blue))
    }
}
 
// MARK: - Field Label
struct AuthFieldLabel: View {
    let title: String
    init(_ title: String) { self.title = title }
    var body: some View {
        Text(title)
            .font(.system(size: 13, weight: .medium))
            .padding(.bottom, 4)
    }
}
 
// MARK: - Text Field
struct AuthTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var isError: Bool = false
 
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding(14)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isError ? Color.red : Color(.systemGray4), lineWidth: 1)
        )
    }
}
 
// MARK: - Primary Button
struct PrimaryButton: View {
    let title: String
    let icon: String
    var isDisabled: Bool = false
    let action: () -> Void
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .background(isDisabled ? blue.opacity(0.4) : blue)
            .cornerRadius(14)
        }
        .disabled(isDisabled)
    }
}
 
// MARK: - OR Divider
struct OrDivider: View {
    var body: some View {
        HStack {
            Rectangle().fill(Color(.systemGray4)).frame(height: 1)
            Text("OR")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
            Rectangle().fill(Color(.systemGray4)).frame(height: 1)
        }
    }
}
 
// MARK: - Google Button
struct GoogleButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 10) {
                // Simple G logo using text — replace with actual Google asset if available
                Text("G")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                Text("Continue with Google")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color(.systemBackground))
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
        }
    }
}
 
// MARK: - Checkbox Toggle Style
struct CheckboxStyle: ToggleStyle {
    let blue: Color
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(configuration.isOn ? blue : Color.clear)
                    .frame(width: 20, height: 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(configuration.isOn ? blue : Color(.systemGray4), lineWidth: 1.5)
                    )
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
    }
}
