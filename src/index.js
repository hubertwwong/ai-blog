// This Worker serves static assets from the public/ directory
// and adds clean URL support (rewrites /about -> /about.html)
export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const path = url.pathname;

    // If path doesn't have an extension and doesn't end with slash,
    // try appending .html
    if (!path.includes('.') && !path.endsWith('/')) {
      // Check if .html version exists via asset fetch
      const htmlPath = path + '.html';
      const asset = await env.ASSETS.fetch(new Request(
        new URL(htmlPath, request.url),
        request
      ));
      if (asset.status !== 404) {
        return asset;
      }
    }

    // Fall through to static assets
    return env.ASSETS.fetch(request);
  }
};
