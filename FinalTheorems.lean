import CompositeProjectionCosts
import MaskedCompositeProjection
import MaskOverlap

/-!
# Smooth cubic-Gauss projections with coprimality masks

Readable entry points for the accompanying proof note. Each constant is
chosen before the ideals, the bounded periodic character, and the scale.
The fixed smooth profile is not quantified after that constant.

`primeCost q j` is 1-1/q+sqrt(q) at j=0, 2sqrt(q)+1/q at j=4,
and q at j=1,2,3,5. `extractedPrimeCost q` is sqrt(2q^(-1/2)+q^(-2)).
The source normalization, primary-generator zeros, and all character
zero extensions are those of the pinned OAI source; see PROOF.txt.
-/
namespace CubicGaussProjections
noncomputable section
open OAI OAI.ActualEisensteinCubic OAI.ConcreteTraceCRT OAI.CubicEisenstein
open OAI.CompletedGauss OAI.CanonicalRowCompletion OAI.CanonicalQuadraticSieve
open OAI.SevenEighths
open QRHExperimental.TrivialProjection QRHExperimental.CompositeProjection
open QRHExperimental.CompositeProjectionCosts QRHExperimental.NonexceptionalProjection
open QRHExperimental.MaskExtraction QRHExperimental.MaskEulerProduct
open scoped BigOperators Classical ContDiff
local notation "Eis" => OAI.ActualEisensteinCubic.O
local notation "support" => OAI.IdealMobiusDivisorSum.primeSupport

/- The full mixed local product, with every positive-support exponent-zero mask retained. -/
theorem mixed_prime_projection
    (W : ℝ → ℂ) (lo hi : ℝ) (hlo : 0 < lo)
    (hsupp : Function.support W ⊆ Set.Icc lo hi) (hW : ContDiff ℝ ∞ W) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (I Q : Ideal Eis) (hI : Supported I), Q ≠ 0 →
      ∀ (φ : Eis →* ℂ), CanonicalCoefficientClass.FactorsModulo Q φ →
      (∀ n, ‖φ n‖ ≤ 1) → ∀ L : ℝ, 0 < L →
      ‖rawProjection (φ*freePrimeRow I hI Q) W L‖ ≤
        C*Real.sqrt L*(Ideal.absNorm Q:ℝ)^(3/4:ℝ)*
          (∏ P : FreePrimeIndex I Q,
            primeCost (Ideal.absNorm P.val.val:ℝ) (freeExponent I Q P))^(1/2:ℝ) :=
  QRHExperimental.CompositeProjectionCosts.rawProjection_composite_prime_product W lo hi hlo hsupp hW

/- A separate admissible mask, disjoint from both the fixed modulus and the moving ideal. -/
theorem coprimality_mask_projection
    (W : ℝ → ℂ) (lo hi : ℝ) (hlo : 0 < lo)
    (hsupp : Function.support W ⊆ Set.Icc lo hi) (hW : ContDiff ℝ ∞ W) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (I M Q : Ideal Eis) (hI : Supported I)
      (hM : Supported M) (hMa : CubicSieve.Admissible M),
      Q ≠ 0 → IsCoprime I M → IsCoprime Q M →
      ∀ (φ : Eis →* ℂ), CanonicalCoefficientClass.FactorsModulo Q φ →
      (∀ n, ‖φ n‖ ≤ 1) → ∀ L : ℝ, 0 < L →
      ‖rawProjection ((φ*freePrimeRow I hI Q)*coprimeMask M hMa) W L‖ ≤
        C*Real.sqrt L*(Ideal.absNorm Q:ℝ)^(3/4:ℝ)*(sourceCost I Q)^(1/2:ℝ)*
          ∏ P ∈ support M, (1+extractedPrimeCost (Ideal.absNorm P:ℝ)) :=
  QRHExperimental.MaskedCompositeProjection.rawProjection_masked_composite W lo hi hlo hsupp hW

/- The separate mask costs an arbitrarily small norm power, uniformly in all ideals. -/
theorem coprimality_mask_subpower
    (W : ℝ → ℂ) (lo hi : ℝ) (hlo : 0 < lo)
    (hsupp : Function.support W ⊆ Set.Icc lo hi) (hW : ContDiff ℝ ∞ W)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (I M Q : Ideal Eis) (hI : Supported I)
      (hM : Supported M) (hMa : CubicSieve.Admissible M),
      Q ≠ 0 → IsCoprime I M → IsCoprime Q M →
      ∀ (φ : Eis →* ℂ), CanonicalCoefficientClass.FactorsModulo Q φ →
      (∀ n, ‖φ n‖ ≤ 1) → ∀ L : ℝ, 0 < L →
      ‖rawProjection ((φ*freePrimeRow I hI Q)*coprimeMask M hMa) W L‖ ≤
        C*Real.sqrt L*(Ideal.absNorm Q:ℝ)^(3/4:ℝ)*(sourceCost I Q)^(1/2:ℝ)*
          (Ideal.absNorm M:ℝ)^ε :=
  QRHExperimental.MaskedCompositeProjection.rawProjection_masked_composite_subpower W lo hi hlo hsupp hW ε hε

#print axioms mixed_prime_projection
#print axioms coprimality_mask_projection
#print axioms coprimality_mask_subpower
end
end CubicGaussProjections
