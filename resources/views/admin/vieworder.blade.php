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

                <br>

                {{-- Form Data Starts Here --}}
                <form class="tablelist-form">
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
                                                <option value="{{ $customer->id }}"
                                                    @if ($customer->id == $orderData->client_id) selected @endif>
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
                                                <option value="{{ $parceltype->id }}"
                                                    @if ($parceltype->id == $orderData->parcel_type) selected @endif>
                                                    {{ $parceltype->label }}</option>
                                            @endforeach
                                        </select>

                                    </div>

                                    <div class="col-span-12  md:col-span-2 lg:col-span-2 2xl:col-span-2">
                                        <label class="inline-block mb-2 text-base font-medium">Weight(kgs) <span
                                                class="text-red-500">*</span></label>
                                        <input type="number" id="total_weight" name="total_weight" disabled
                                            value="{{ $orderData->total_weight }}"
                                            class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                            required>

                                    </div>

                                    <div class="col-span-12  md:col-span-2 lg:col-span-2 2xl:col-span-2">
                                        <label class="inline-block mb-2 text-base font-medium">No. Of Parcels<span
                                                class="text-red-500">*</span></label>
                                        <input type="number" id="total_parcel" name="total_parcel" disabled
                                            value="{{ $orderData->total_parcel }}"
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
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Company Name
                                                        <span class="text-red-500">*</span></label>
                                                    <input type="text" id="pi_company_name" name="pi_company_name"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required value="{{ $orderData->pi_company_name }}" disabled>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Department <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="pi_department" name="pi_department"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required value="{{ $orderData->pi_department_name }}" disabled>
                                                </div>
                                            </div>
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">First Name <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="pi_first_name" name="pi_first_name"
                                                        value="{{ $orderData->pi_first_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Last Name <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="pi_last_name" name="pi_last_name"
                                                        value="{{ $orderData->pi_last_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                            </div>
                                            <label class="inline-block mb-2 text-base font-medium">Pickup Location <span
                                                    class="text-red-500">*</span></label>
                                            <input type="text" id="pickup_address" name="pickup_address" disabled
                                                value="{{ $orderData->pickup_address }}"
                                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                required>
                                            <br>
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Postal Code <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="pickup_point" name="pickup_point"
                                                        onkeypress="calculate();" disabled
                                                        value="{{ $orderData->pickup_point }}"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Contact Number
                                                        <span class="text-red-500">*</span></label>
                                                    <input type="text" id="pickup_contact" name="pickup_contact"
                                                        disabled value="{{ $orderData->pickup_contact }}"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                            </div>
                                            <br>
                                            <label class="inline-block mb-2 text-base font-medium">Pickup Description <span
                                                    class="text-red-500">*</span></label>
                                            <textarea id="pickup_instructions" name="pickup_instructions" disabled value="{{ $orderData->pickup_instructions }}"
                                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                required>{{ $orderData->pickup_instructions }}</textarea>
                                        </div>
                                    </div><!--end col-->
                                    <div class="col-span-12 lg:col-span-6 order-[13] 2xl:order-1 card 2xl:col-span-3">
                                        <div class="card-body">
                                            <h6 class="mb-3 text-15">Delivery Information</h6>
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Company Name
                                                        <span class="text-red-500">*</span></label>
                                                    <input type="text" id="di_company_name" name="di_company_name"
                                                        value="{{ $orderData->di_company_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Department <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="di_department" name="di_department"
                                                        value="{{ $orderData->pi_department_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                            </div>
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">First Name <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="di_first_name" name="di_first_name"
                                                        value="{{ $orderData->pi_first_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Last Name <span
                                                            class="text-red-500">*</span></label>
                                                    <input type="text" id="di_last_name" name="di_last_name"
                                                        value="{{ $orderData->pi_last_name }}" disabled
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                            </div>
                                            <label class="inline-block mb-2 text-base font-medium">Delivery Location <span
                                                    class="text-red-500">*</span></label>
                                            <input type="text" id="delivery_address" name="delivery_address" disabled
                                                value="{{ $orderData->delivery_address }}"
                                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                required>
                                            <br>
                                            <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 mb-3">
                                                <div class="col-span-12  md:col-span-5 lg:col-span-5 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Postal Code
                                                        <span class="text-red-500">*</span></label>
                                                    <input type="text" id="delivery_point" name="delivery_point"
                                                        onkeypress="calculate();" disabled
                                                        value="{{ $orderData->delivery_point }}"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                                <div class="col-span-12  md:col-span-7 lg:col-span-7 2xl:col-span-2">
                                                    <label class="inline-block mb-2 text-base font-medium">Contact Number
                                                        <span class="text-red-500">*</span></label>
                                                    <input type="text" id="delivery_contact" name="delivery_contact"
                                                        disabled value="{{ $orderData->delivery_contact }}"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        required>
                                                </div>
                                            </div>
                                            <br>
                                            <label class="inline-block mb-2 text-base font-medium">Delivery Description
                                                <span class="text-red-500">*</span></label>
                                            <textarea id="delivery_instructions" name="delivery_instructions" disabled
                                                class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                required>{{ $orderData->delivery_instructions }}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="btnsec">
                                    <button type="button" data-modal-target="showModal" data-bs-toggle="modal"
                                        id="print-btn" data-bs-target="#showModal"
                                        class="float-right text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20 add-btn"><i
                                            class="fa fa-print"></i> Print</button>


                                    <br>


                                </div>


                            </div>
                        </div>
                </form>
                {{-- Form data ends here --}}
                
                <div id="showModal" modal-center class="fixed flex flex-col hidden transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 show">
                    {{-- <div class="w-screen md:w-[50rem] bg-white shadow rounded-md dark:bg-zink-600"> --}}

                        <style>
                            .invoice {
                            max-width: 800px;
                            margin: auto;
                            background-color: #fff;
                            border-radius: 8px;
                            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
                            padding: 40px;
                            }

                            

                            table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-top: 20px;
                            background-color: #fff;
                            }

                            th,
                            td {
                            border-bottom: 1px solid #e0e0e0;
                            padding: 16px;
                            text-align: center;
                            }

                            th {
                            background-color: #fff;
                            color: black;
                            }

                            td {
                            background-color: #fff;
                            text-align: right;
                            }

                            .description-col {
                            width: 35%;
                            }

                            .quantity-col,
                            .price-col {
                            width: 20%;
                            }

                            .total-col {
                            width: 25%;
                            text-align: right;
                            }

                            .totals {
                            text-align: right;
                            margin-top: 20px;
                            position: relative;
                            }

                            .no-print {
                            display: none;
                            }

                            @media print {
                            .no-print {
                                display: none !important;
                            }
                            }

                            input[type="text"],
                            input[type="number"] {
                            width: calc(100%);
                            box-sizing: border-box;
                            word-wrap: break-word;
                            margin-top: 4px;
                            margin-bottom: 4px;
                            border: none;
                            border-bottom: 2px solid #f5f5f5;
                            outline: none;
                            background-color: transparent;
                            }

                            .add-row-btn,
                            .rmw-row-btn,
                            .print-row-btn,
                            button {
                            display: inline-block;
                            margin-top: 20px;
                            float: left;
                            padding: 14px 28px;
                            position: left;
                            margin-right: 5px;
                            color: white;
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 1em;
                            transition: background-color 0.3s ease, transform 0.3s ease;
                            }

                            .add-row-btn {
                            background-color: #189bcc;
                            }

                            .add-row-btn:hover {
                            background-color: #4b4e6c;
                            }

                            .rmw-row-btn {
                            background-color: #f68b70;
                            }

                            .rmw-row-btn:hover {
                            background-color: #f35a33;
                            }

                            .print-row-btn {
                            background-color: darkgrey;
                            }

                            .print-row-btn:hover {
                            background-color: grey;
                            }

                            button {
                            margin-top: 20px;
                            display: block;
                            }

                            .footer {
                            text-align: center;
                            margin-top: 40px;
                            font-size: 0.8em;
                            color: #666;
                            }

                            .tax-field strong {
                            margin-right: 10px;
                            white-space: nowrap;
                            }

                            .tax-field input {
                            width: 80px;
                            margin-left: 5px;
                            }
                            
                            .tax {
                            display: flex;
                            }

                            .invc{
                                display: flex;
                                justify-content: space-between
                            }
                            .abc{
                                margin: 0 auto;
                            }
                            
                        </style>

<div class="invoice">
    {{-- <h1 id="invoice-type" onclick="toggleInvoiceType()"><span class="material-icons"></span>Faktura</h1> --}}
    
   <div class="invc">
    <div class="col-span-6  md:col-span-6 lg:col-span-3 2xl:col-span-2 ">
        <img src="{{url('/assets/images/logo_color.png')}}" width="100px" alt="">
        <p style="font-weight: 800; ">Postcode Pvt. Ltd.</p>
        <p>London, UK</p>
    </div>
    <div class="col-span-6  md:col-span-6 lg:col-span-3 2xl:col-span-2">
        <p style="font-weight: 800; ">{{$orderData->pi_first_name}} {{$orderData->pi_last_name}}</p>
        <p>{{$orderData->pi_company_name}}</p>
        <p>{{$orderData->pi_department_name}}</p>
    </div>
   </div>
    

    <table id="invoice-table">
      <thead>
        <tr>
          <th class="description-col">Parcel Type</th>
          <th class="quantity-col">Weight</th>
          <th class="price-col">No. Of Parcel</th>
          <th class="total-col">Total Charges</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{{$orderData->parcel_label}}</td>
          <td>{{$orderData->total_weight}}</td>
          <td>{{$orderData->total_parcel}}</td>
          <td>{{$orderData->total_amount}}</td>
        </tr>
      </tbody>
    </table>

    <div class="totals">

    
      <p><strong>Fixed Charges:</strong> <span id="subtotal">{{$orderData->fixed_charges}}</span></p>
      <p><strong>Moms:</strong> <span id="tax-amount">{{$orderData->}}</span></p>
      <p><strong>Total:</strong> <span id="total">0,00 DKK</span></p>

    <div class="abc">
        <button class="add-row-btn no-print" onclick="print()">Print</button>
    </div>

    </div>
</div>

  <div class="footer">

   
  </div>
  </div>

  <script>
    // function toggleInvoiceType() {
    //   var invoiceType = document.getElementById('invoice-type');
    //   if (invoiceType.innerText === "Faktura") {
    //     invoiceType.innerText = "Tilbud";
    //   } else {
    //     invoiceType.innerText = "Faktura";
    //   }
    // }

    function addRow() {
      const table = document.getElementById('invoice-table').getElementsByTagName('tbody')[0];
      const newRow = document.createElement('tr');
      newRow.innerHTML = `<td><input type="text" placeholder="Varebeskrivelse"></td>
                          <td><input type="number" placeholder="Antal" oninput="calculateTotal(this)"></td>
                          <td><input type="number" placeholder="Pris" oninput="calculateTotal(this)"></td>
                          <td class="total">0,00 DKK</td>
                          <td class="no-print"><button class="material-icons remove-row" onclick="removeRow(this)">delete</button></td>`;
      table.appendChild(newRow);
    }

    function removeRow(element) {
      const row = element.closest('tr');
      row.parentNode.removeChild(row);
      updateTotals();
    }

    function removeLastRow() {
      const table = document.getElementById('invoice-table').getElementsByTagName('tbody')[0];
      if (table.rows.length > 1) {
        table.deleteRow(-1);
        updateTotals();
      }
    }

    function calculateTotal(element) {
      const row = element.closest('tr');
      const quantity = row.cells[1].getElementsByTagName('input')[0].value;
      const price = row.cells[2].getElementsByTagName('input')[0].value;
      const total = row.cells[3];
      total.innerText = `${(quantity * price).toFixed(2)} DKK`;
      updateTotals();
    }

    function updateTotals() {
      const rows = document.querySelectorAll('#invoice-table tbody tr');
      let subtotal = 0;
      rows.forEach(row => {
        const total = parseFloat(row.cells[3].innerText.replace(' DKK', ''));
        subtotal += total;
      });
      const taxRate = document.getElementById('tax').value / 100;
      const taxAmount = subtotal * taxRate;
      const totalAmount = subtotal + taxAmount;
      document.getElementById('subtotal').innerText = `${subtotal.toFixed(2)} DKK`;
      document.getElementById('tax-amount').innerText = `${taxAmount.toFixed(2)} DKK`;
      document.getElementById('total').innerText = `${totalAmount.toFixed(2)} DKK`;
    }
  </script>




                        
                    </div>
                </div>







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
