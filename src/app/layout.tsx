import type { Metadata } from "next";
import "./globals.css";
import Providers from "@/components/Providers";

export const metadata: Metadata = {
  title: "Tissue and Eye Bank Operations",
  description: "Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
<script src="/feature-pack/feature-pack.js" defer />
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
