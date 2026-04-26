---
layout: post
title: "Upgrade Record: Firefox ESR and Thunderbird ESR 140.10.0"
date: 2026-04-26 20:45:00 +0800
categories: packaging update
tags: [deepin, firefox-esr, thunderbird, esr]
---

Today I completed a deepin Linux packaging upgrade for two applications:

- Firefox ESR: `140.9.1esr` -> `140.10.0esr`
- Thunderbird ESR: `140.9.1esr` -> `140.10.0esr`

This is a deepin package maintenance update, not a global release for all platforms.

### What I updated

1. Bumped the ESR version in both deepin packaging scripts.
2. Verified script syntax with `bash -n`.
3. Confirmed source URL reachability for the new ESR archives.

### Why this update matters

Keeping Firefox ESR and Thunderbird ESR up to date for deepin Linux helps maintain security patches, reduces packaging drift, and keeps downstream users on a stable ESR track.

I will continue checking Mozilla ESR releases and record future deepin package upgrades in follow-up posts.
