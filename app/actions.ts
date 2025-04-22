"use server"

export async function sendContactEmail(formData: FormData) {
  try {
    // Get form data
    const name = formData.get("name") as string
    const email = formData.get("email") as string
    const message = formData.get("message") as string

    // In a real implementation, you would use a service like Nodemailer, SendGrid, etc.
    // For now, we'll just log the data that would be sent
    console.log("Sending email to: contact@flapp.meme")
    console.log("From:", email)
    console.log("Name:", name)
    console.log("Message:", message)

    // Simulate a delay for the "sending" process
    await new Promise((resolve) => setTimeout(resolve, 500))

    return { success: true, message: "Message sent successfully!" }
  } catch (error) {
    console.error("Error sending email:", error)
    return { success: false, message: "Failed to send message. Please try again." }
  }
}
