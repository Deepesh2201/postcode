@extends('admin.layouts.main')
@section('main-section')
    <div class="relative min-h-screen group-data-[sidebar-size=sm]:min-h-sm">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <div
            class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
            <div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">

                <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
                    <div class="grow">
                        <h5 class="text-16">Order Details</h5>
                    </div>

                </div>
                <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5">
                    <div class="relative col-span-12 overflow-hidden card 2xl:col-span-8 bg-slate-900">
                        <div class="absolute inset-0">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-100" version="1.1"
                                xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev/svgjs"
                                width="1440" height="560" preserveAspectRatio="none" viewBox="0 0 1440 560">
                                <g mask="url(&quot;#SvgjsMask1000&quot;)" fill="none">
                                    <use xlink:href="#SvgjsSymbol1007" x="0" y="0"></use>
                                    <use xlink:href="#SvgjsSymbol1007" x="720" y="0"></use>
                                </g>
                                <defs>
                                    <mask id="SvgjsMask1000">
                                        <rect width="1440" height="560" fill="#ffffff"></rect>
                                    </mask>
                                    <path d="M-1 0 a1 1 0 1 0 2 0 a1 1 0 1 0 -2 0z" id="SvgjsPath1003"></path>
                                    <path d="M-3 0 a3 3 0 1 0 6 0 a3 3 0 1 0 -6 0z" id="SvgjsPath1004"></path>
                                    <path d="M-5 0 a5 5 0 1 0 10 0 a5 5 0 1 0 -10 0z" id="SvgjsPath1001"></path>
                                    <path d="M2 -2 L-2 2z" id="SvgjsPath1005"></path>
                                    <path d="M6 -6 L-6 6z" id="SvgjsPath1002"></path>
                                    <path d="M30 -30 L-30 30z" id="SvgjsPath1006"></path>
                                </defs>
                                <symbol id="SvgjsSymbol1007">
                                    <use xlink:href="#SvgjsPath1001" x="30" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="30" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="30" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="30" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="30" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="30" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="30" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="30" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="30" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="30" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="90" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1004" x="90" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="90" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="90" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="90" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="150" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="150" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="150" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="150" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="150" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="150" y="330" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1004" x="150" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="150" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="150" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="150" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="210" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="210" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="210" y="150" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1002" x="210" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="210" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="210" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="210" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="210" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="210" y="510" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1003" x="210" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="270" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="270" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="270" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="270" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="270" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="270" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="270" y="390" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1002" x="270" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="270" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="270" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="330" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="330" y="90" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1002" x="330" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="330" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="330" y="270" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1001" x="330" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="330" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="330" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="330" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="330" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1004" x="390" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="390" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="390" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="390" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="390" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="390" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="390" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="390" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="390" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="390" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1004" x="450" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="450" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="450" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="450" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="450" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="510" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="510" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="510" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="510" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="510" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1004" x="510" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="510" y="390" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1001" x="510" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="510" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="510" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="570" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="570" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="570" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="570" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="570" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="570" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="570" y="390" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1005" x="570" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="570" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="570" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="630" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="630" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="630" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="630" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="630" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="630" y="330" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1002" x="630" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="630" y="450" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1001" x="630" y="510" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="630" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="690" y="30" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="690" y="90" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="690" y="150" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1002" x="690" y="210" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1005" x="690" y="270" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1001" x="690" y="330" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="690" y="390" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1003" x="690" y="450" stroke="rgba(32, 43, 61, 1)"></use>
                                    <use xlink:href="#SvgjsPath1006" x="690" y="510" stroke="rgba(32, 43, 61, 1)"
                                        stroke-width="3"></use>
                                    <use xlink:href="#SvgjsPath1003" x="690" y="570" stroke="rgba(32, 43, 61, 1)"></use>
                                </symbol>
                            </svg>
                        </div>

                    </div><!--end col-->

                </div><!--end grid-->

                <br>

                {{-- Form Data Starts Here --}}
                <form class="tablelist-form"  action="{{url('admin/saveOrderWeb')}}" method="POST">
                    @csrf
                {{-- <div class="grid grid-cols-12 gap-x-5" id="schedule" style="display: none;">

                    <div class="order-12 col-span-12 lg:col-span-6 2xl:order-1 card 2xl:col-span-3">
                        <div class="card-body">
                            <h6 class="mb-3 text-15">Pickup Time</h6>
                            <label class="inline-block mb-2 text-base font-medium">Date <span
                                    class="text-red-500">*</span></label>
                            <input type="date" id="pickuptime" name="pickuptime"
                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                required>

                            <br>
                            <div class="grid grid-cols-1 gap-4 xl:grid-cols-12">
                                <div class="xl:col-span-6">
                                    <label for="phoneNumberInput"
                                        class="inline-block mb-2 text-base font-medium">From</label>
                                    <input type="time" id="phoneNumberInput"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        placeholder="Enter phone number" required>
                                </div>
                                <div class="xl:col-span-6">
                                    <label for="locationInput" class="inline-block mb-2 text-base font-medium">To</label>
                                    <input type="time" id="locationInput"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        placeholder="Enter location" required>
                                </div>
                            </div>
                            <br>


                        </div>
                    </div>
                    <div class="col-span-12 lg:col-span-6 order-[13] 2xl:order-1 card 2xl:col-span-3">
                        <div class="card-body">
                            <h6 class="mb-3 text-15">Delivery Time</h6>
                            <label class="inline-block mb-2 text-base font-medium">Date <span
                                    class="text-red-500">*</span></label>
                            <input type="date" id="deliverytime" name="deliverytime"
                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                required>

                            <br>
                            <div class="grid grid-cols-1 gap-4 xl:grid-cols-12">
                                <div class="xl:col-span-6">
                                    <label for="phoneNumberInput"
                                        class="inline-block mb-2 text-base font-medium">From</label>
                                    <input type="time" id="phoneNumberInput"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        placeholder="Enter phone number" required>
                                </div>
                                <div class="xl:col-span-6">
                                    <label for="locationInput" class="inline-block mb-2 text-base font-medium">To</label>
                                    <input type="time" id="locationInput"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        placeholder="Enter location" required>
                                </div>
                            </div>


                            <br>


                        </div>
                    </div>
                </div> --}}




                <div class="card  p-5">
                    <div class="card-body">
                        <div class="grid grid-cols-12 2xl:grid-cols-12 ">
                            <div class="col-span-12  md:col-span-6 lg:col-span-6 2xl:col-span-2">


                            </div><!--end col-->
                            <div class="col-span-12  md:col-span-6 lg:col-span-6 2xl:col-span-2">

                            </div><!--end col-->
                        </div>


                        <div class="mt-5">


                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                <div class="col-span-12  md:col-span-4 lg:col-span-4 2xl:col-span-2">
                                    <label class="inline-block mb-2 text-base font-medium">Customer <span
                                            class="text-red-500">*</span></label>
                                    <select type="text" id="client_id" name="client_id" disabled
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        required>
                                        @foreach ($customers as $customer)
                                            <option value="{{ $customer->id }}" @if ($customer->id == $orderData->client_id) selected @endif>
                                                {{ $customer->name }}({{ $customer->contact_number }})
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                                <div class="col-span-12  md:col-span-3 lg:col-span-3 2xl:col-span-2">
                                    <label class="inline-block mb-2 text-base font-medium">Parcel Type <span
                                            class="text-red-500">*</span></label>
                                    <select type="text" id="parcel_type" name="parcel_type" disabled
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        required>
                                        @foreach ($parceltypes as $parceltype)
                                            <option value="{{ $parceltype->id }}" @if ($parceltype->id == $orderData->parcel_type) selected @endif>{{ $parceltype->label }}</option>
                                        @endforeach
                                    </select>

                                </div>

                                <div class="col-span-12  md:col-span-2 lg:col-span-2 2xl:col-span-2">
                                    <label class="inline-block mb-2 text-base font-medium">Weight(kgs) <span
                                            class="text-red-500">*</span></label>
                                    <input type="number" id="total_weight" name="total_weight" disabled value="{{$orderData->total_weight}}"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        required>

                                </div>

                                <div class="col-span-12  md:col-span-2 lg:col-span-2 2xl:col-span-2">
                                    <label class="inline-block mb-2 text-base font-medium">No. Of Parcels<span
                                            class="text-red-500">*</span></label>
                                    <input type="number" id="total_parcel" name="total_parcel" disabled value="{{$orderData->total_parcel}}"
                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                        required>

                                </div>


                            </div>
                            <hr>
                            <br>
                            <div class="grid grid-cols-12 gap-x-5">

                                <div class="order-12 col-span-12 lg:col-span-6 2xl:order-1 card 2xl:col-span-3">
                                    <div class="card-body">
                                        <h6 class="mb-3 text-15">Pickup Information</h6>
                                        <input type="hidden" value="1" id="status" name="status">
                                        <label class="inline-block mb-2 text-base font-medium">Pickup Location <span
                                                class="text-red-500">*</span></label>
                                        <input type="text" id="pickup_address" name="pickup_address" disabled value="{{$orderData->pickup_address}}"
                                            class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                            required>
                                        <br>
                                        <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                            <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                <label class="inline-block mb-2 text-base font-medium">Postal Code <span
                                                        class="text-red-500">*</span></label>
                                                <input type="text" id="pickup_point" name="pickup_point" onkeypress="calculate();" disabled value="{{$orderData->pickup_point}}"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    required>
                                            </div>
                                            <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                <label class="inline-block mb-2 text-base font-medium">Contact Number <span
                                                        class="text-red-500">*</span></label>
                                                <input type="text" id="pickup_contact" name="pickup_contact" disabled value="{{$orderData->pickup_contact}}"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    required>
                                            </div>
                                        </div>
                                        <br>
                                        <label class="inline-block mb-2 text-base font-medium">Pickup Description <span
                                                class="text-red-500">*</span></label>
                                        <textarea id="pickup_instructions" name="pickup_instructions" disabled value="{{$orderData->pickup_instructions}}"
                                            class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                            required>{{ $orderData->pickup_instructions }}</textarea>
                                    </div>
                                </div><!--end col-->
                                <div class="col-span-12 lg:col-span-6 order-[13] 2xl:order-1 card 2xl:col-span-3">
                                    <div class="card-body">
                                        <h6 class="mb-3 text-15">Delivery Information</h6>
                                        <label class="inline-block mb-2 text-base font-medium">Delivery Location <span
                                                class="text-red-500">*</span></label>
                                        <input type="text" id="delivery_address" name="delivery_address" disabled value="{{$orderData->delivery_address}}"
                                            class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                            required>
                                        <br>
                                        <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                            <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                <label class="inline-block mb-2 text-base font-medium">Postal Code <span
                                                        class="text-red-500">*</span></label>
                                                <input type="text" id="delivery_point" name="delivery_point" onkeypress="calculate();" disabled value="{{$orderData->delivery_point}}"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    required>
                                            </div>
                                            <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                <label class="inline-block mb-2 text-base font-medium">Contact Number <span
                                                        class="text-red-500">*</span></label>
                                                <input type="text" id="delivery_contact" name="delivery_contact" disabled value="{{$orderData->delivery_contact}}"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    required>
                                            </div>
                                        </div>
                                        <br>
                                        <label class="inline-block mb-2 text-base font-medium">Delivery Description <span
                                                class="text-red-500">*</span></label>
                                        <textarea id="delivery_instructions" name="delivery_instructions" disabled class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                            required>{{$orderData->delivery_instructions}}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="btnsec">
                           {{-- <a href="/admin/orders"> <button type="submit" id="porderbtn" name="porderbtn"
                                class="float-right text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20 add-btn">
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                Back To List</button> </a>
                                
                           <a href="orderupdate/{{$orderData->id}}"> <button type="button" id="calbtn" name="calbtn" style="display: block"
                                class="float-right text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20 add-btn"> <i class="fa fa-clock-o" aria-hidden="true"></i>
                                Edit</button></a>
                            </div> --}}
                                

                            
                            <br>

                            {{-- <div class="col-span-12  md:col-span-6 lg:col-span-6 2xl:col-span-2">
                                <label class="inline-block mb-2 text-base font-medium">Payment Collection From <span
                                        class="text-red-500">*</span></label>
                                <select type="text"
                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                    required>
                                    <option value="">Pickup Location</option>
                                    <option value="">Delivery Location</option>

                                </select>

                            </div> --}}

                        </div>


                    </div>
                </div>
                </form>
                {{-- Form data ends here --}}









                <script>
                    function calculate() {
                        document.getElementById('porderbtn').style.display = 'none';
                        document.getElementById('calbtn').style.display = 'block';
                        if (document.getElementById('pickup_point').value == "") {
                            alert('Please enter source postal code');
                            return false;
                        }
                        if (document.getElementById('delivery_point').value == "") {
                            alert('Please enter destination postal code');
                            return false;
                        }
                        var data = {
                            code1: document.getElementById('pickup_point').value,
                            code2: document.getElementById('delivery_point').value
                        };
                        var csrfToken = document.querySelector('meta[name="csrf-token"]').content;

                        fetch('/calculatecharge', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-TOKEN': csrfToken
                                },
                                body: JSON.stringify(data)
                            })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                document.getElementById('chargec').innerHTML = 'Your estimated charge will be :' + data;
                                document.getElementById('porderbtn').style.display = 'block';
                                document.getElementById('calbtn').style.display = 'none';
                            })
                            .catch(error => {
                                console.error('There wasan error!', error);
                                document.getElementById('chargec').innerHTML = 'No data found';
                            });
                    }

                    
                </script>
                <script>
                    function toggleButtons() {
                        document.getElementById('porderbtn').style.display = 'none';
                        document.getElementById('calbtn').style.display = 'block';
                    }
                    </script>




            </div>
            <!-- container-fluid -->
        </div>
    @endsection
