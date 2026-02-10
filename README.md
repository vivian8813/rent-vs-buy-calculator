# Rent vs Buy Calculator

A comprehensive rent vs buy comparison calculator with country-specific versions for the USA, UK, Canada, and Australia. Features break-even analysis, 30-year cost projections, and interactive charts.

## Features

- **Break-even Analysis**: Shows how many years you need to stay in a home for buying to become cheaper than renting
- **30-Year Cost Table**: Detailed average monthly and annual costs for 1-30 years
- **Interactive Chart**: Visual comparison of buying vs renting costs over time
- **Country-Specific Presets**: Tailored defaults for USA, UK, Canada, and Australia
- **Shareable URLs**: Bookmark or share calculator configurations via URL parameters
- **SEO Optimized**: Includes hreflang tags, structured data (Schema.org), and FAQ sections
- **Mobile Responsive**: Works on all device sizes

## Files

- `rent-vs-buy-calculator.html` - Main calculator (default: USA)
- `rent-vs-buy-calculator-usa.html` - USA-specific version
- `rent-vs-buy-calculator-uk.html` - UK-specific version
- `_redirects` - Clean URL mappings for Netlify/Static hosting
- `robots.txt` - Search engine crawler rules
- `sitemap.xml` - XML sitemap for SEO

## Country Pages

| Country | File | Currency | Default Preset |
|---------|------|----------|----------------|
| USA | `rent-vs-buy-calculator-usa.html` | USD | Property tax 1.2%, Closing costs 2.5% |
| UK | `rent-vs-buy-calculator-uk.html` | GBP | Council tax proxy 1.2%, Stamp duty 2.5% |
| Canada | (coming soon) | CAD | - |
| Australia | (coming soon) | AUD | - |

## Future SEO Pages

The USA and UK pages include internal link hubs for:

- **City pages**: New York, London, Los Angeles, Manchester, etc.
- **Time horizon pages**: Short-term, long-term, 5 years, 10 years, break-even
- **Financing scenarios**: First-time buyer, high/low interest rates, cash purchase, down payment variations

These long-tail keyword pages can be published as individual HTML files to capture organic search traffic.

## Calculator Model

The calculator compares the **true cost of buying** vs **true cost of renting**:

### Buying Costs Include:
- Mortgage payments (principal + interest)
- Property taxes
- Home insurance
- HOA fees
- Maintenance costs
- Buying closing costs
- Selling closing costs
- **Opportunity cost** of down payment and upfront cash

### Renting Costs Include:
- Monthly rent (with annual increases)
- Renter's insurance
- Security deposit opportunity cost
- Upfront application/moving costs

### Net Equity Recovery:
- Future home value appreciation
- Remaining mortgage balance
- Selling costs

## Customization

### Adding a New Country Page

1. Copy an existing country page (e.g., `rent-vs-buy-calculator-uk.html`)
2. Update the `presetDefaults()` function with country-specific values
3. Update currency symbols and labels throughout
4. Update SEO meta tags, hreflang links, and Schema.org data
5. Add country-specific FAQ and SEO content
6. Add entry to `sitemap.xml` and `_redirects`

### Modifying Default Presets

Edit the `presetDefaults()` function in the JavaScript:

```javascript
function presetDefaults(preset){
  const map = {
    usa: { propertyTaxAnnualPct: 1.2, buyingClosingCostPct: 2.5, sellingCostPct: 6.0, homeInsuranceAnnual: 1800 },
    canada: { propertyTaxAnnualPct: 1.0, buyingClosingCostPct: 2.0, sellingCostPct: 5.0, homeInsuranceAnnual: 1600 },
    uk: { propertyTaxAnnualPct: 0.4, buyingClosingCostPct: 1.5, sellingCostPct: 2.5, homeInsuranceAnnual: 500 },
    australia: { propertyTaxAnnualPct: 0.3, buyingClosingCostPct: 3.0, sellingCostPct: 2.5, homeInsuranceAnnual: 1200 }
  };
  return map[preset] || map.usa;
}
```

## Deployment

### Netlify / Vercel / Static Hosting

1. Upload all files to your hosting provider
2. The `_redirects` file will handle clean URLs
3. Ensure `robots.txt` and `sitemap.xml` are accessible at the root

### Clean URLs

Thanks to `_redirects`, users can access pages via:
- `https://yoursite.com/rent-vs-buy-calculator` (instead of `.html`)

## License

© 2025 Rent vs Buy Calculator. All rights reserved.

## Credits

Built with vanilla HTML, CSS, and JavaScript. No external dependencies.
