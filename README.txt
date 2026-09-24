FAMBRIDGE BRAND REFINEMENT PACKAGE
==================================

This package does NOT write to GitHub.

Design intent
-------------
Quiet / warm / refined / editorial / human / cultured / understated.

Logo rule
---------
The source is the original Fambridge Logo.jpg.

Unchanged:
- Bridge / people geometry
- Circle positions
- FAMBRIDGE wordmark geometry
- Tagline geometry
- Relative positions and proportions

Changed:
- Orange background hue only, adapted to muted amber #DFA66B
- Crop around the existing artwork for header use

Files
-----
assets/img/fambridge-logo.jpg
    Replacement logo asset.

assets/css/brand-refinement.css
    Additive visual override. It must load after site.css.

apply-brand-refinement.sh
    Local-only helper. It:
    - Adds brand-refinement.css to all English and French pages.
    - Adds a cache-busting version to fambridge-logo.jpg.
    - Does not access GitHub.

How to use
----------
From the fambridge-website repository root:

1. Copy this package's assets directory into the repo, replacing the logo:
     cp -R /path/to/fambridge-brand-refinement/assets ./

2. Copy the helper script:
     cp /path/to/fambridge-brand-refinement/apply-brand-refinement.sh ./
     chmod +x apply-brand-refinement.sh

3. Apply the HTML link/cache update:
     ./apply-brand-refinement.sh

4. Preview locally:
     python3 -m http.server 8000

5. Open:
     http://localhost:8000/

6. Review:
     git diff

7. Commit and push yourself when satisfied.

Palette
-------
Muted amber: #DFA66B
Warm ivory:  #F7F2EA
Soft paper:  #F0EBE3
Ink navy:    existing Fambridge navy

The Header and Hero use the same muted amber so the official logo no longer
looks like a separate orange sticker placed on a white bar.
