//
//  Copyright 2019 Square Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import FBSnapshotTestCase

@testable import AccessibilitySnapshotDemo

// This class is currently testing functionality that has not yet been added to the public API. Once it has been
// completed and made public, this can be changed back to a standard import.
@testable import AccessibilitySnapshot

final class TextAccessibilityTests: SnapshotTestCase {

    func testDynamicType() {
        let viewController = DynamicTypeViewController()
        viewController.view.frame = UIScreen.main.bounds

        FBSnapshotVerifyView(viewController.view)

        SnapshotVerify(viewController.view, at: .extraSmall, identifier: "XS")
        SnapshotVerify(viewController.view, at: .extraExtraExtraLarge, identifier: "XXXL")
        SnapshotVerify(viewController.view, at: .accessibilityExtraExtraExtraLarge, identifier: "AXXXL")

        // This has the same (empty) identifier as the initial snapshot, so it will use the same
        // image to compare. This is meant to test that the view is restored to its initial state.
        FBSnapshotVerifyView(viewController.view)
    }

}
