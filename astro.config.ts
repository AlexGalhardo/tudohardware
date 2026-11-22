import path from "node:path";
import { fileURLToPath } from "node:url";
import react from "@astrojs/react";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "astro/config";

const root = path.dirname(fileURLToPath(import.meta.url));

// The custom domain serves the site at the root of its own origin.
export default defineConfig({
	site: "https://tudohardware.com",
	base: process.env.BASE_PATH || "/",
	output: "static",
	srcDir: "./astro",
	trailingSlash: "never",
	integrations: [react()],
	vite: {
		plugins: [tailwindcss()],
		resolve: {
			alias: {
				"@": root,
			},
		},
	},
});
