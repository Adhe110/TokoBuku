<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/icon.png" type="image/png">



    <title>Admin - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

    <div class="container mx-auto">
        <!-- Alert Section -->
        @if ($errors->any())
            <div class="max-w-md mx-auto mt-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (session('error'))
            <div class="max-w-md mx-auto mt-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                {{ session('error') }}
            </div>
        @endif

        <!-- Login Form -->
        <form action="{{ route('admin.login') }}" method="POST" class="max-w-md mx-auto mt-10 bg-white p-6 rounded-lg shadow-lg">
            @csrf
            <h2 class="text-2xl font-bold text-center mb-6">Admin Login</h2>
            
            <div class="mb-4">
                <label for="email" class="block text-gray-700 font-bold mb-2">Email</label>
                <input type="email" name="email" id="email" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Email" value="{{ old('email') }}" required>
            </div>
            
            <div class="mb-4">
                <label for="password" class="block text-gray-700 font-bold mb-2">Password</label>
                <div class="relative">
                    <input type="password" name="password" id="password" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Password" required>
                    <button type="button" id="togglePassword" class="absolute right-3 top-2 text-gray-500">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M10 3c-3.5 0-6.5 2.5-7.5 6a8.018 8.018 0 0015 0c-1-3.5-4-6-7.5-6zm0 2c2.8 0 5.2 2.1 6 5-.8 2.9-3.2 5-6 5s-5.2-2.1-6-5c.8-2.9 3.2-5 6-5zm0 2c-.8 0-1.5.7-1.5 1.5S9.2 10 10 10s1.5-.7 1.5-1.5S10.8 7 10 7zm0 2c-.3 0-.5-.2-.5-.5S9.7 8 10 8s.5.2.5.5S10.3 9 10 9z"/>
                        </svg>
                    </button>
                </div>
            </div>



            <button type="submit" class="w-full bg-emerald-500 text-white font-bold py-2 px-4 rounded-lg hover:bg-emerald-600 transition duration-200">Login</button>
        </form>
    </div>

    <script>
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        
        togglePassword.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
        });
    </script>
    
</body>
</html>