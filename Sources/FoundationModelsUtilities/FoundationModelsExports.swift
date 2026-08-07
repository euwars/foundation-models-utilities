//===----------------------------------------------------------------------===//
//
// This source file is part of the Foundation Models open source project.
//
// Copyright © 2024-2027 Apple Inc. and the Foundation Models project authors.
//
// Licensed under the Apache License v2.0
//
// See LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

// The one place the `ServerFoundationModels` trait is spelled. Every other
// file in the module — and every module that imports this one, the test
// targets included — sees the framework's types through this re-export and
// needs no import of its own.
//
// Re-exporting is deliberate, not just convenience: this package's public API
// is stated in the framework's vocabulary (`Skills` is dynamic instructions,
// `ChatCompletionsLanguageModel` is a `LanguageModel`), so a consumer would
// otherwise have to write the matching import themselves and get it right for
// whichever trait configuration they built with.
#if ServerFoundationModels
@_exported public import ServerFoundationModels
#else
@_exported public import FoundationModels
#endif
