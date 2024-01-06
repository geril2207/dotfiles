function FindProxyForURL(_url, host) {
  const urlsToProxy = [
    /chess\.com/,
    /chat\.openai\.com/,
    /oaistatic/,
    /2ip/,
    /instagram/,
    /linkedin/,
    /twitter/,
    /twimg/,
  ];
  const proxyUrl = "PROXY";

  for (const url of urlsToProxy) {
    if (url.test(host)) return proxyUrl;
  }

  return "DIRECT";
}
