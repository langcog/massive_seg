massive_seg
===========

Materials for massive segmentation experiment (Frank, Tenenbaum, &amp; Gibson, 2013, PLOS ONE)

This matlab codebase allows the synthesis of large-scale languages like the ones we used in our 2013 paper. It's a bit messy, as I wrote this code back in 2006-2008 as part of the first work I did on this topic. The basic goal is to generate a library of WAV files reflecting the structure of the large-scale language generated in core/genLexMSeg.m.

Note that for speech synthesis, we used the mbrola synthesizer, included here in the repository. Unfortunately, mbrola hasn't been maintained recently and so is only available for binary download for PPC mac machines. But it could still be recompiled from source or run on Windows, I suspect. 