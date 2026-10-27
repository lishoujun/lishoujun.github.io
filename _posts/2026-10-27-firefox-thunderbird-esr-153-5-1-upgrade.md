---
layout: post
title: "Upgrade Record: Firefox ESR and Thunderbird ESR 153.5.1"
date: 2026-10-27 08:15:00 +0800
categories: packaging update
tags: [deepin, firefox-esr, thunderbird, esr]
---

Today I completed a deepin Linux packaging upgrade for two applications:

- Firefox ESR: `140.17.0esr` -> `153.5.1esr`
- Thunderbird ESR: `140.17.0esr` -> `153.5.1esr`

This is a deepin package maintenance update, not a global release for all platforms.

### What I updated

1. Bumped the ESR version in both deepin packaging scripts.
2. Verified script syntax with `bash -n`.
3. Confirmed source URL reachability for the new ESR archives.

### Why this update matters

The Firefox/Thunderbird 140 ESR branch has reached end of life, and Mozilla now ships `153.5.1esr` as the current ESR channel. Keeping deepin packages on the active ESR track helps maintain security patches and reduces packaging drift.

I will continue checking Mozilla ESR releases and record future deepin package upgrades in follow-up posts.
