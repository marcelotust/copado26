abstract final class AppConstants {
  static const String appName = 'Copado 26';
  static const Duration scanDebounce = Duration(seconds: 2);

  static const double scanOverlayHeightRatio = 0.22;
  static const double scanOverlayWidthRatio = 0.75;
}

abstract final class WorldCup2026Teams {
  static const Map<String, String> codes = {
    'ARG': 'Argentina',
    'BRA': 'Brasil',
    'FRA': 'França',
    'ENG': 'Inglaterra',
    'GER': 'Alemanha',
    'ESP': 'Espanha',
    'POR': 'Portugal',
    'NED': 'Países Baixos',
    'BEL': 'Bélgica',
    'ITA': 'Itália',
    'URU': 'Uruguai',
    'COL': 'Colômbia',
    'MEX': 'México',
    'USA': 'Estados Unidos',
    'CAN': 'Canadá',
    'MAR': 'Marrocos',
    'SEN': 'Senegal',
    'NGA': 'Nigéria',
    'EGY': 'Egito',
    'CMR': 'Camarões',
    'GHA': 'Gana',
    'CIV': 'Costa do Marfim',
    'TUN': 'Tunísia',
    'MLI': 'Mali',
    'JPN': 'Japão',
    'KOR': 'Coreia do Sul',
    'AUS': 'Austrália',
    'IRN': 'Irã',
    'SAU': 'Arábia Saudita',
    'QAT': 'Catar',
    'CHN': 'China',
    'IDN': 'Indonésia',
    'NZL': 'Nova Zelândia',
    'SUI': 'Suíça',
    'CRO': 'Croácia',
    'DEN': 'Dinamarca',
    'AUT': 'Áustria',
    'POL': 'Polônia',
    'UKR': 'Ucrânia',
    'SRB': 'Sérvia',
    'CZE': 'República Tcheca',
    'HUN': 'Hungria',
    'SVK': 'Eslováquia',
    'ROU': 'Romênia',
    'GRE': 'Grécia',
    'ALB': 'Albânia',
    'SLO': 'Eslovênia',
    'GEO': 'Geórgia',
  };

  /// FIFA 3-letter code → ISO 3166-1 alpha-2 code for flag emoji generation.
  static const Map<String, String> isoCodes = {
    'ARG': 'AR',
    'BRA': 'BR',
    'FRA': 'FR',
    'ENG': 'GB',
    'GER': 'DE',
    'ESP': 'ES',
    'POR': 'PT',
    'NED': 'NL',
    'BEL': 'BE',
    'ITA': 'IT',
    'URU': 'UY',
    'COL': 'CO',
    'MEX': 'MX',
    'USA': 'US',
    'CAN': 'CA',
    'MAR': 'MA',
    'SEN': 'SN',
    'NGA': 'NG',
    'EGY': 'EG',
    'CMR': 'CM',
    'GHA': 'GH',
    'CIV': 'CI',
    'TUN': 'TN',
    'MLI': 'ML',
    'JPN': 'JP',
    'KOR': 'KR',
    'AUS': 'AU',
    'IRN': 'IR',
    'SAU': 'SA',
    'QAT': 'QA',
    'CHN': 'CN',
    'IDN': 'ID',
    'NZL': 'NZ',
    'SUI': 'CH',
    'CRO': 'HR',
    'DEN': 'DK',
    'AUT': 'AT',
    'POL': 'PL',
    'UKR': 'UA',
    'SRB': 'RS',
    'CZE': 'CZ',
    'HUN': 'HU',
    'SVK': 'SK',
    'ROU': 'RO',
    'GRE': 'GR',
    'ALB': 'AL',
    'SLO': 'SI',
    'GEO': 'GE',
  };

  /// Returns the flag emoji for a FIFA 3-letter code, e.g. "BRA" → "🇧🇷".
  static String flagOf(String fifaCode) {
    final iso = isoCodes[fifaCode];
    if (iso == null) return '🏳️';
    // Regional indicator symbols: A = U+1F1E6, offset from 'A' (0x41).
    const base = 0x1F1E6 - 0x41;
    return String.fromCharCodes(
      iso.toUpperCase().codeUnits.map((c) => base + c),
    );
  }

  static const int stickersPerTeam = 18;
}
