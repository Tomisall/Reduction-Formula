# Reduction-Formula
iOS app for reducing repersentations using the Reduction Formula. Used in Physical Chemistry (Group Theory). 

The reduction formula, the vital, simple, but painfully long-winded calculation that is taught in all physical chemistry (and related areas) group theory courses, and provides insight into IR spectra and much more besides. Here it is shown below:

n(Γ) = 1/h Σ χ(r) ∙ χ(i) ∙ N

where:

n(Γ) - is the number of times a given reducible representation, Γ, occurs in the sum.

h - is the order of the group (i.e. the number of symmetry operations in the group, not just the number of classes)

χ(r) - is the character in the reducible representation  

χ(i) - is the character in the irreducible representation

N - is the number of symmetry operations in a given class

If you've been through such a course you will appreciate that getting an answer out of this can take a little more time than you'd like, and if you are going through such a course you'll often find practice problems without answers you can check against your own.

This app sort to solves these issues. Simply select the point group, type in the reducible representation you have worked out, and the app will reduce it for you.

## To note:
This is an iOS app I wrote back in 2015. It was one of my first apps. It did the job I needed it to back then. The code is now quite old and even when new it was never *elegant* to say the least. Also, if I'm only calling the code 'not elegent' then I'm not sure what euphemism I could possibly use to describe the UI... Maybe one day I'll rewrite and rerelease this app to fix these issues. Hopefully some users find it helpful.
