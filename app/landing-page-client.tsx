"use client"
import LandingPage from "@/components/landing-page"

// Dummy function to simulate sending an email. Replace with your actual implementation.
async function sendContactEmail(formData: FormData): Promise<{ success: boolean; message: string }> {
  // Simulate a successful email send after a short delay
  await new Promise((resolve) => setTimeout(resolve, 1000))

  return { success: true, message: "Email sent successfully!" }
}

export default function LandingPageClient() {
  return <LandingPage />
}
