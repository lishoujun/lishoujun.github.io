---
layout: post
title: "Upgrade Record: Firefox ESR 153.6.0 and Thunderbird ESR 153.5.1"
date: 2026-10-27 08:20:00 +0800
categories: packaging update
tags: [deepin, firefox-esr, thunderbird, esr]
---

Today I completed a deepin Linux packaging upgrade for two applications on the ESR 153 track:

- Firefox ESR: `140.17.0esr` -> `153.6.0esr`
- Thunderbird ESR: `140.17.0esr` -> `153.5.1esr`

This is a deepin package maintenance update, not a global release for all platforms. The `main` branch continues to track the ESR 140 line; this ESR 153 packaging work lives on the `esr-153` branch.

### What I updated

1. Bumped the ESR version in both deepin packaging scripts to the latest available build for each product.
2. Verified script syntax with `bash -n`.
3. Confirmed source URL reachability for the new ESR archives.

### Why this update matters

Mozilla has moved the current ESR channel to the 153 line. Tracking each product's latest available ESR 153 build helps keep deepin packages on a supported security path while the ESR 140 packaging line remains available on `main`.

I will continue checking Mozilla ESR releases and record future deepin package upgrades in follow-up posts.
