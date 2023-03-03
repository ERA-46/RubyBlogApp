 Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_51Mh5RiKjFELnaoo90qDpMtWxrGRtxWeQ14xAlxatRtU3WDMhVCE4riGsS9k1glTv1ABLCSSnju9rFclk08BU1PrX00AfcCRqEq', 
  :secret_key => 'sk_test_51Mh5RiKjFELnaoo9wH2umJtN3yHCqh6IAKxUwmZdLAoifRCE89biIv5HRaDltBDvZPcdSdginzAUx5EEcBDn9wSs007wtITut3',
  :signing_key => 'whsec_b2bf7bbcdbd962ff702b01f81e90a0a471d5c74b461d4d7eb7f882fe2f216da7'
}   

Stripe.api_key = Rails.configuration.stripe[:secret_key]