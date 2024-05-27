//
//  AvatarHelper.swift
//  Neone.net
//
//  Created by Dave Glassco on 8/13/19.
//  Copyright © 2019 Neone. All rights reserved.
//
#if !os(macOS)
import UIKit

enum AvatarHelper {
    static func convertToAvatarData(profileName: String, avatarString: String?) -> AvatarImageViewDataSource {
        var profileAvatar: UIImage?

        if let avatarEncodedString = avatarString {
            if !avatarEncodedString.isEmpty {
                if let avatarData = Data(base64Encoded: avatarEncodedString) {
                    profileAvatar = UIImage(data: avatarData) ?? nil
                }
            }
        }

        struct AvatarData: AvatarImageViewDataSource {
            var name: String
            var avatar: UIImage?

            init(profileName: String, profileAvatar: UIImage?) {
                name = profileName
                avatar = profileAvatar
            }
        }

        return AvatarData(profileName: profileName, profileAvatar: profileAvatar)
    }
}
#endif
