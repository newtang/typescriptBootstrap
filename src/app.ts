// Simple TypeScript Hello World application

interface GreetingOptions {
    name?: string;
    time?: Date;
}

class HelloWorld {
    private messageElement: HTMLElement | null;

    constructor() {
        console.log('HelloWorld constructor');
        this.messageElement = document.getElementById('message');
        this.init();
    }

    private init(): void {
        if (this.messageElement) {
            this.displayGreeting();
        } else {
            console.error('Message element not found!');
        }
    }

    private getGreeting(options: GreetingOptions = {}): string {
        const { name = 'World', time = new Date() } = options;
        const hour = time.getHours();
        
        let timeGreeting: string;
        if (hour < 12) {
            timeGreeting = 'Good morning';
        } else if (hour < 18) {
            timeGreeting = 'Good afternoon';
        } else {
            timeGreeting = 'Good evening';
        }

        return `${timeGreeting}, ${name}! 👋`;
    }

    private displayGreeting(): void {
        if (!this.messageElement) return;

        const greeting = this.getGreeting();
        this.messageElement.textContent = greeting;
        
        // Add some animation
        this.messageElement.style.opacity = '0';
        this.messageElement.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            if (this.messageElement) {
                this.messageElement.style.transition = 'all 0.5s ease-in-out';
                this.messageElement.style.opacity = '1';
                this.messageElement.style.transform = 'translateY(0)';
            }
        }, 100);
    }
}

// Initialize the application when the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new HelloWorld();
});

// Export for potential module usage
export { HelloWorld, GreetingOptions }; 