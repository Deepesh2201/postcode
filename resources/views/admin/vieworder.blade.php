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
                <style>
                            body {
                                margin-top: 20px;
                                background-color: #f7f7ff;
                                font-family: Arial, sans-serif;
                            }

                            #showModal {
                                width: 80%;
                                height: 80%;
                                top: 50%;
                                left: 50%;
                                transform: translate(-50%, -50%);
                                overflow-y: auto;
                            }

                            #invoice {
                                padding: 0px;
                            }

                            .invoice {
                                position: relative;
                                background-color: #FFF;
                                padding: 5px;
                            }

                            .invoice header {
                                padding: 10px 0;
                                margin-bottom: 20px;
                                border-bottom: 1px solid #0d6efd;
                            }

                            .invoice .company-details {
                                text-align: right;
                            }

                            .invoice .company-details .name {
                                margin-top: 0;
                                margin-bottom: 0;
                            }

                            .invoice .contacts {
                                margin-bottom: 20px;
                            }

                            .invoice .invoice-to {
                                text-align: left;
                            }

                            .invoice .invoice-to .to {
                                margin-top: 0;
                                margin-bottom: 0;
                            }

                            .invoice .invoice-details {
                                text-align: right;
                            }

                            .invoice .invoice-details .invoice-id {
                                margin-top: 0;
                                color: #0d6efd;
                            }

                            .invoice main {
                                padding-bottom: 50px;
                            }

                            .invoice main .thanks {
                                margin-top: -100px;
                                font-size: 2em;
                                margin-bottom: 50px;
                            }

                            .invoice main .notices {
                                padding-left: 6px;
                                border-left: 6px solid #0d6efd;
                                background: #e7f2ff;
                                padding: 10px;
                            }

                            .invoice main .notices .notice {
                                font-size: 1.2em;
                            }

                            .invoice table {
                                width: 100%;
                                border-collapse: collapse;
                                border-spacing: 0;
                                margin-bottom: 20px;
                            }

                            .invoice table td,
                            .invoice table th {
                                padding: 15px;
                                background: #eee;
                                border-bottom: 1px solid #fff;
                            }

                            .invoice table th {
                                white-space: nowrap;
                                font-weight: 400;
                                font-size: 16px;
                            }

                            .invoice table td h3 {
                                margin: 0;
                                font-weight: 400;
                                color: #0d6efd;
                                font-size: 1.2em;
                            }

                            .invoice table .qty,
                            .invoice table .total,
                            .invoice table .unit {
                                text-align: right;
                                font-size: 1.2em;
                            }

                            .invoice table .no {
                                color: #fff;
                                font-size: 1.6em;
                                background: #0d6efd;
                            }

                            .invoice table .unit {
                                background: #ddd;
                            }

                            .invoice table .total {
                                background: #0d6efd;
                                color: #fff;
                            }

                            .invoice table tbody tr:last-child td {
                                border: none;
                            }

                            .invoice table tfoot td {
                                background: 0 0;
                                border-bottom: none;
                                white-space: nowrap;
                                text-align: right;
                                padding: 10px 20px;
                                font-size: 1.2em;
                                border-top: 1px solid #aaa;
                            }

                            .invoice table tfoot tr:first-child td {
                                border-top: none;
                            }

                            .card {
                                position: relative;
                                display: flex;
                                flex-direction: column;
                                min-width: 0;
                                word-wrap: break-word;
                                background-color: #fff;
                                background-clip: border-box;
                                border: 0px solid rgba(0, 0, 0, 0);
                                border-radius: .25rem;
                                margin-bottom: 1.5rem;
                                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
                            }

                            .invoice table tfoot tr:last-child td {
                                color: #0d6efd;
                                font-size: 1.4em;
                                border-top: 1px solid #0d6efd;
                            }

                            .invoice table tfoot tr td:first-child {
                                border: none;
                            }

                            .invoice footer {
                                width: 100%;
                                text-align: center;
                                color: #777;
                                border-top: 1px solid #aaa;
                                padding: 8px 0;
                            }

                            @media print {
                                .invoice {
                                    font-size: 11px !important;
                                    overflow: hidden !important;
                                }

                                .invoice footer {
                                    position: absolute;
                                    bottom: 10px;
                                    page-break-after: always;
                                }

                                .invoice>div:last-child {
                                    page-break-before: always;
                                }
                            }
                        </style>
                <div id="showModal" modal-center
                    class="fixed flex flex-col hidden transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 show">
                    <div class="w-screen md:w-[50rem] bg-white shadow rounded-md dark:bg-zink-600">

                        <div class="flex items-center justify-between p-4 border-b border-slate-200 dark:border-zink-500">
                            <h5 class="text-16" id="exampleModalLabel">Add Address</h5>

                        </div>
                        <div class="container">
                            <div class="card">
                                <div class="card-body">
                                    <div id="invoice">
                                        <div class="toolbar hidden-print">
                                            <div class="text-end">
                                                <button type="button" class="btn btn-dark"><i class="fa fa-print"></i>
                                                    Print</button>
                                                <button type="button" class="btn btn-danger"><i
                                                        class="fa fa-file-pdf-o"></i> Export as PDF</button>
                                            </div>
                                            <hr>
                                        </div>
                                        <div class="invoice overflow-auto">
                                            <div style="min-width: 600px">
                                                <header>
                                                    <div class="row">
                                                        <div class="col">
                                                            <a href="javascript:;">
                                                                <img src="assets/images/logo-icon.png" width="80"
                                                                    alt="">
                                                            </a>
                                                        </div>
                                                        <div class="col company-details">
                                                            <h2 class="name">
                                                                <a target="_blank" href="javascript:;">
                                                                    Arboshiki
                                                                </a>
                                                            </h2>
                                                            <div>455 Foggy Heights, AZ 85004, US</div>
                                                            <div>(123) 456-789</div>
                                                            <div>company@example.com</div>
                                                        </div>
                                                    </div>
                                                </header>
                                                <main>
                                                    <div class="row contacts">
                                                        <div class="col invoice-to">
                                                            <div class="text-gray-light">INVOICE TO:</div>
                                                            <h2 class="to">John Doe</h2>
                                                            <div class="address">796 Silver Harbour, TX 79273, US</div>
                                                            <div class="email"><a
                                                                    href="mailto:john@example.com">john@example.com</a>
                                                            </div>
                                                        </div>
                                                        <div class="col invoice-details">
                                                            <h1 class="invoice-id">INVOICE 3-2-1</h1>
                                                            <div class="date">Date of Invoice: 01/10/2018</div>
                                                            <div class="date">Due Date: 30/10/2018</div>
                                                        </div>
                                                    </div>
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th class="text-left">DESCRIPTION</th>
                                                                <th class="text-right">HOUR PRICE</th>
                                                                <th class="text-right">HOURS</th>
                                                                <th class="text-right">TOTAL</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="no">04</td>
                                                                <td class="text-left">
                                                                    <h3>
                                                                        <a target="_blank" href="javascript:;">
                                                                            Youtube channel
                                                                        </a>
                                                                    </h3>
                                                                    <a target="_blank" href="javascript:;">
                                                                        Useful videos
                                                                    </a> to improve your Javascript skills. Subscribe and
                                                                    stay tuned :)
                                                                </td>
                                                                <td class="unit">$0.00</td>
                                                                <td class="qty">100</td>
                                                                <td class="total">$0.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="no">01</td>
                                                                <td class="text-left">
                                                                    <h3>Website Design</h3>Creating a recognizable design
                                                                    solution based on the company's existing visual identity
                                                                </td>
                                                                <td class="unit">$40.00</td>
                                                                <td class="qty">30</td>
                                                                <td class="total">$1,200.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="no">02</td>
                                                                <td class="text-left">
                                                                    <h3>Website Development</h3>Developing a Content
                                                                    Management System-based Website
                                                                </td>
                                                                <td class="unit">$40.00</td>
                                                                <td class="qty">80</td>
                                                                <td class="total">$3,200.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="no">03</td>
                                                                <td class="text-left">
                                                                    <h3>Search Engines Optimization</h3>Optimize the site
                                                                    for search engines (SEO)
                                                                </td>
                                                                <td class="unit">$40.00</td>
                                                                <td class="qty">20</td>
                                                                <td class="total">$800.00</td>
                                                            </tr>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td colspan="2"></td>
                                                                <td colspan="2">SUBTOTAL</td>
                                                                <td>$5,200.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"></td>
                                                                <td colspan="2">TAX 25%</td>
                                                                <td>$1,300.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"></td>
                                                                <td colspan="2">GRAND TOTAL</td>
                                                                <td>$6,500.00</td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                    <div class="thanks">Thank you!</div>
                                                    <div class="notices">
                                                        <div>NOTICE:</div>
                                                        <div class="notice">A finance charge of 1.5% will be made on unpaid
                                                            balances after 30 days.</div>
                                                    </div>
                                                </main>
                                                <footer>Invoice was created on a computer and is valid without the signature
                                                    and seal.</footer>
                                            </div>
                                            <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
