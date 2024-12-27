<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KategoriMiddleware
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        // Periksa apakah admin sudah login
        if (!Auth::guard('admin')->check()) {
            // Jika belum login, arahkan ke halaman login admin
            return redirect()->route('admin.login');
        }

        // Lanjutkan jika admin sudah login
        return $next($request);
    }
}
